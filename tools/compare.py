"""Compares the compiled functions with the original, byte for byte.

    compare.py [SYMBOL...]

Nothing is masked. Each fixup in an object must sit where the original
has one (a self-relative call has none in either) and must resolve to the
address the original uses: an external through config/symbols.csv, a
segment of the same module through that segment's place in the original,
which is worked out from its first use and must be the same for every
other. The CONST, CONST2 and _DATA bytes of each placed segment must
then match the original's too.

With SYMBOLs, shows a disassembly diff for each.
"""
import csv, difflib, glob, os, struct, subprocess, sys, tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import le, omf

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EXE = "build/tomb.exe"
PADDING = (b"\x8d\x40\x00", b"\x8b\xc0", b"\x90")


class Original:
    def __init__(self, path):
        objs, fixups = le.LE(path).image()
        self.objs = [(base, bytes(m)) for base, m, _ in objs]
        self.fixups = {src: tgt for src, tgt, kind in fixups if kind != 8}

    def read(self, addr, n):
        for base, m in self.objs:
            if base <= addr and addr + n <= base + len(m):
                return m[addr - base:addr - base + n]
        raise ValueError(f"{addr:#x}+{n} is outside the image")


def load_symbols():
    rows = list(csv.DictReader(open(os.path.join(ROOT, "config/symbols.csv"))))
    by_symbol = {r["symbol"]: r for r in rows if r["symbol"]}
    by_addr = {int(r["address"], 16): r for r in rows}
    return by_symbol, by_addr


class Result:
    def __init__(self, name, addr):
        self.name, self.addr = name, addr
        self.errors = []
        self.ours = None
        self.size = 0

    def ok(self):
        return not self.errors


def strip_padding(b):
    for pad in PADDING:
        if b.endswith(pad) and len(b) > len(pad):
            return b[:-len(pad)]
    return b


def compare_module(mod, orig, by_symbol):
    results = []
    bases = {}
    segs = mod.segments
    for seg, name, start, end in mod.functions():
        row = by_symbol.get(name)
        if not row:
            r = Result(name, None)
            r.errors.append("not in config/symbols.csv")
            results.append(r)
            continue
        addr = int(row["address"], 16)
        r = Result(row["name"], addr)
        results.append(r)
        si = segs.index(seg)
        want = addr - start
        if bases.setdefault(si, want) != want:
            r.errors.append(f"{seg.name} is placed at {bases[si]:#x} by an earlier function, "
                            f"this one puts it at {want:#x}")
        ours = bytearray(strip_padding(bytes(seg.data[start:end])))
        try:
            theirs = orig.read(addr, len(ours))
        except ValueError as e:
            r.errors.append(str(e))
            continue
        fixed = set()
        for f in seg.fixups:
            if not start <= f.offset < end:
                continue
            at = addr + f.offset - start
            off = f.offset - start
            fixed.update(range(at, at + f.size))
            if f.size != 4:
                r.errors.append(f"{f.size}-byte fixup at {at:#x}")
                continue
            inline, = struct.unpack_from("<i", ours, off)
            if f.rel:
                if at in orig.fixups:
                    r.errors.append(f"self-relative fixup at {at:#x}, the original's is absolute")
                    continue
                target = at + 4 + struct.unpack_from("<i", theirs, off)[0]
            else:
                if at not in orig.fixups:
                    r.errors.append(f"fixup at {at:#x}, the original has none")
                    continue
                target = orig.fixups[at]
            kind, what = f.target
            if kind == "ext":
                sym = by_symbol.get(what)
                if not sym:
                    r.errors.append(f"{what} is not in config/symbols.csv; the original uses "
                                    f"{target - f.disp - inline:#x}")
                    continue
                expect = int(sym["address"], 16) + f.disp + inline
            elif kind == "seg":
                base = target - f.disp - inline
                placed = bases.setdefault(what, base)
                if placed != base:
                    r.errors.append(f"{segs[what].name}+{f.disp + inline:#x} at {at:#x} puts the segment at "
                                    f"{base:#x}, it is at {placed:#x}")
                    continue
                expect = placed + f.disp + inline
            else:
                r.errors.append(f"unsupported fixup target {f.target} at {at:#x}")
                continue
            if expect != target:
                r.errors.append(f"{what if kind == 'ext' else segs[what].name}+{f.disp + inline:#x} "
                                f"at {at:#x} is {expect:#x}, the original's is {target:#x}")
            val = expect - (at + 4) if f.rel else expect
            struct.pack_into("<I", ours, off, val & 0xFFFFFFFF)
        for at in range(addr, addr + len(ours)):
            if at in orig.fixups and at not in fixed:
                r.errors.append(f"the original has a fixup at {at:#x}, this has none")
        diff = [addr + i for i in range(len(ours)) if addr + i not in fixed and ours[i] != theirs[i]]
        if diff:
            r.errors.append(f"{len(diff)} bytes differ, first at {diff[0]:#x}")
        size = int(row["size"]) if row["size"] else 0
        if size and len(ours) != size:
            r.errors.append(f"{len(ours)} bytes, the original's is {size}")
        r.ours, r.size = bytes(ours), len(ours)
    for si, base in bases.items():
        seg = segs[si]
        if seg.is_code() or seg.cls.upper() == "BSS" or not seg.size:
            continue
        theirs = orig.read(base, seg.size)
        if bytes(seg.data) != theirs:
            i = next(i for i in range(seg.size) if seg.data[i] != theirs[i])
            r = Result(f"{seg.name} of {os.path.basename(mod.name)}", base)
            r.errors.append(f"data differs at {base + i:#x}")
            results.append(r)
    return results, bases


def disasm(blob, addr):
    with tempfile.NamedTemporaryFile(suffix=".bin") as t:
        t.write(blob)
        t.flush()
        out = subprocess.run(["objdump", "-D", "-b", "binary", "-m", "i386", "-M", "intel",
                              f"--adjust-vma={addr:#x}", t.name], capture_output=True, text=True).stdout
    return [l for l in out.splitlines() if l[:1] == " "]


def main():
    os.chdir(ROOT)
    orig = Original(EXE)
    by_symbol, _ = load_symbols()
    results = []
    for path in sorted(glob.glob("build/obj/*.obj")):
        for mod in omf.modules(path):
            results += compare_module(mod, orig, by_symbol)[0]
    wanted = sys.argv[1:]
    for r in results:
        if wanted and r.name not in wanted:
            continue
        print(f"{'ok' if r.ok() else 'MISMATCH':8} {r.addr or 0:#010x} {r.name}")
        for e in r.errors:
            print(f"         {e}")
        if wanted and r.ours is not None:
            a = disasm(r.ours, r.addr)
            b = disasm(orig.read(r.addr, max(r.size, 1)), r.addr)
            sys.stdout.writelines(difflib.unified_diff(b, a, "original", "ours", lineterm="\n", n=3)
                                  if a != b else [])
            for line in difflib.unified_diff(b, a, "original", "ours", lineterm=""):
                print(line)
    if not wanted:
        good = [r for r in results if r.ok() and r.addr]
        print(f"{len(good)} of {len(results)} match, {sum(r.size for r in good)} bytes")
    sys.exit(0 if all(r.ok() for r in results if not wanted or r.name in wanted) else 1)


if __name__ == "__main__":
    main()
