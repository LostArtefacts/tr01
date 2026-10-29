"""Compiles src/*.c with Watcom C 10.6 under Wine into build/obj/.

    build.py [FILE.c...]

WATCOM is the compiler directory, with BINNT, H and LIB386. It defaults
to ~/opt/watcom10.6 or ~/data.local/watcom/10.6. An object is rebuilt
when its source or any header in src/ is newer.
"""
import glob, os, subprocess, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CFLAGS = ["-bt=dos", "-5r", "-oneatx", "-zq"]


def watcom():
    for d in [os.environ.get("WATCOM"), os.path.expanduser("~/opt/watcom10.6"),
              os.path.expanduser("~/data.local/watcom/10.6")]:
        if d and os.path.isfile(os.path.join(d, "BINNT", "WCC386.EXE")):
            return d
    sys.exit("error: set WATCOM to a Watcom C 10.6 directory (see orig/README.md)")


def winpath(path):
    return "Z:" + os.path.abspath(path).replace("/", "\\")


def env(w):
    e = dict(os.environ)
    e.setdefault("WINEPREFIX", os.path.join(ROOT, ".wine"))
    e.setdefault("WINEDEBUG", "-all")
    e["WATCOM"] = winpath(w)
    e["INCLUDE"] = winpath(os.path.join(ROOT, "src")) + ";" + winpath(os.path.join(w, "H"))
    return e


def compile(w, src, obj):
    cmd = ["wine", os.path.join(w, "BINNT", "WCC386.EXE"), *CFLAGS,
           "-fo=" + winpath(obj), winpath(src)]
    r = subprocess.run(cmd, env=env(w), capture_output=True, text=True)
    out = "\n".join(l for l in r.stdout.splitlines() + r.stderr.splitlines() if l.strip())
    if r.returncode or not os.path.exists(obj):
        sys.exit(f"{out}\nerror: {os.path.relpath(src, ROOT)} failed to compile")
    if out:
        print(out)


def main():
    os.chdir(ROOT)
    w = watcom()
    os.makedirs("build/obj", exist_ok=True)
    srcs = sys.argv[1:] or sorted(glob.glob("src/*.c"))
    headers = max((os.path.getmtime(h) for h in glob.glob("src/*.h")), default=0)
    if not sys.argv[1:]:
        names = {os.path.splitext(os.path.basename(s))[0] for s in srcs}
        for obj in glob.glob("build/obj/*.obj"):
            if os.path.splitext(os.path.basename(obj))[0] not in names:
                os.remove(obj)
    built = 0
    for src in srcs:
        obj = os.path.join("build/obj", os.path.splitext(os.path.basename(src))[0] + ".obj")
        if os.path.exists(obj) and os.path.getmtime(obj) >= max(os.path.getmtime(src), headers):
            continue
        if os.path.exists(obj):
            os.remove(obj)
        compile(w, src, obj)
        built += 1
    print(f"{built} of {len(srcs)} objects rebuilt")


if __name__ == "__main__":
    main()
