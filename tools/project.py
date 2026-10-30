"""Reads project.toml, the one place for the project's facts and paths:
the original's name and location, its code's range, the compiler and
assembler flags, and where Watcom, MASM, Ghidra and DOSBox are installed.

    project.py get KEY        print a setting (game.name, ghidra.project...)
    project.py ghidra         print the Ghidra installation's directory
    project.py orig           verify the original's checksums, copy it to build/
    project.py game           set up build/game: game files, CD image, hooked exe
    project.py clean          remove build outputs (keeps the Ghidra project)

The file is project.toml in the repository's root (the directory above
tools/), or the one the DECOMP_PROJECT environment variable names. Other
tools import this module and read `config`, or the shorthands below.
Paths in the file are relative to the repository's root. The search
lists are globs, with ~ for the home directory, tried in order, the
newest match of each first; the WATCOM, MASM, GHIDRA and DOSBOX
environment variables override them.
"""
import copy, glob, os, shutil, subprocess, sys, tomllib

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATH = os.environ.get("DECOMP_PROJECT") or os.path.join(ROOT, "project.toml")

REQUIRED = object()

DEFAULTS = {
    "game": {
        "name": REQUIRED,
        "dir": REQUIRED,
        "exe": REQUIRED,
        "original": REQUIRED,
        "game_end": REQUIRED,
        "code": REQUIRED,
        "hooked": REQUIRED,
        "title": "",
        "checksums": "",
        "copy": [],
        "link": [],
        "cd": "",
    },
    "ghidra": {
        "search": ["~/opt/ghidra_*"],
        "project": "",
        "functions": "build/functions_ghidra.csv",
    },
    "build": {
        "watcom": ["~/opt/watcom10.6"],
        "masm": ["~/opt/masm611"],
        "cflags": REQUIRED,
        "asflags": ["/nologo", "/c", "/Cp"],
        "hook_base": 0x200000,
    },
    "symbols": {
        "libs": [],
    },
    "dosbox": {
        "search": ["~/opt/dosbox-staging*/dosbox"],
    },
}


def merge(defaults, values, where=""):
    """`values` over `defaults`, refusing keys `defaults` doesn't know."""
    out = copy.deepcopy(defaults)
    for key, value in values.items():
        name = where + key
        if key not in defaults:
            sys.exit(f"{PATH}: unknown setting {name}")
        if isinstance(value, dict) and isinstance(defaults.get(key), dict) and defaults[key]:
            out[key] = merge(defaults[key], value, name + ".")
        else:
            out[key] = value
    return out


def load(path=PATH):
    try:
        with open(path, "rb") as f:
            values = tomllib.load(f)
    except FileNotFoundError:
        sys.exit(f"{path} is missing")
    config = merge(DEFAULTS, values)
    for section, settings in config.items():
        for name, value in settings.items():
            if value is REQUIRED:
                sys.exit(f"{path}: {section}.{name} is required")
    game = config["game"]
    game["title"] = game["title"] or game["name"]
    config["ghidra"]["project"] = config["ghidra"]["project"] or game["name"]
    return config


config = load()
NAME = config["game"]["name"]
ORIGINAL = config["game"]["original"]
GAME_END = config["game"]["game_end"]
CODE = tuple(config["game"]["code"])
ELF = f"build/{NAME}.elf"
FUNCTIONS = "build/functions.csv"
GAME = "build/game"
HOOKED = os.path.join(GAME, config["game"]["hooked"])


def get(key):
    value = config
    for part in key.split("."):
        if not isinstance(value, dict) or part not in value:
            sys.exit(f"no setting {key}")
        value = value[part]
    return value


def locate(var, patterns, holds=""):
    """What the environment variable `var` names, or else the first match
    of the globs `patterns`, the newest of each first, that holds the
    file `holds`."""
    ok = lambda p: os.path.exists(os.path.join(p, holds) if holds else p)
    if os.environ.get(var) and (not holds or ok(os.environ[var])):
        return os.environ[var]
    for pattern in patterns:
        for path in sorted(glob.glob(os.path.expanduser(pattern)), reverse=True):
            if ok(path):
                return path


def watcom():
    return locate("WATCOM", config["build"]["watcom"], os.path.join("BINNT", "WCC386.EXE")) or \
        sys.exit("error: set WATCOM or build.watcom to a Watcom C 10.6 directory (see orig/README.md)")


def masm():
    return locate("MASM", config["build"]["masm"], "ML.EXE") or \
        sys.exit("error: set MASM or build.masm to a directory with MASM 6.11's ML.EXE "
                 "(see orig/README.md)")


def ghidra_home():
    return locate("GHIDRA", config["ghidra"]["search"]) or \
        sys.exit("error: set GHIDRA or ghidra.search to a Ghidra installation")


def dosbox():
    return locate("DOSBOX", config["dosbox"]["search"]) or \
        sys.exit("error: set DOSBOX or dosbox.search to a dosbox-staging binary")


def orig():
    """Verifies the original's files against game.checksums and copies the
    executable to game.original."""
    sums = config["game"]["checksums"]
    if sums:
        subprocess.run(["sha1sum", "--quiet", "-c", os.path.basename(sums)],
                       cwd=os.path.join(ROOT, os.path.dirname(sums)), check=True)
    os.makedirs(os.path.dirname(ORIGINAL), exist_ok=True)
    shutil.copyfile(os.path.join(config["game"]["dir"], config["game"]["exe"]), ORIGINAL)


def game():
    """Copies game.copy and links game.link into build/game, and writes the
    original with the compiled functions hooked in to game.hooked."""
    import patch_exe
    src = config["game"]["dir"]
    os.makedirs(os.path.dirname(HOOKED), exist_ok=True)
    for name in config["game"]["copy"]:
        os.makedirs(os.path.dirname(os.path.join(GAME, name)), exist_ok=True)
        shutil.copyfile(os.path.join(src, name), os.path.join(GAME, name))
    for pattern in config["game"]["link"]:
        for path in sorted(glob.glob(os.path.join(src, pattern))):
            link = os.path.join(GAME, os.path.relpath(path, src))
            if os.path.lexists(link):
                os.remove(link)
            os.symlink(os.path.abspath(path), link)
    patch_exe.patch(HOOKED)


def clean():
    for path in ["build/obj", GAME, "build/shots", *glob.glob(f"build/{NAME}.*")]:
        if os.path.isdir(path):
            shutil.rmtree(path)
        elif os.path.exists(path):
            os.remove(path)


def main():
    os.chdir(ROOT)
    args = sys.argv[1:]
    if args[:1] == ["get"] and len(args) == 2:
        value = get(args[1])
        print(" ".join(map(str, value)) if isinstance(value, list) else value)
    elif args == ["ghidra"]:
        print(ghidra_home())
    elif len(args) == 1 and args[0] in ("orig", "game", "clean"):
        globals()[args[0]]()
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main()
