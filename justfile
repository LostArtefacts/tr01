export WINEPREFIX := justfile_directory() / ".wine"
export WINEDEBUG := env("WINEDEBUG", "-all")

exe := "build/tomb.exe"

# List recipes
default:
    @just --list

# Compile src/ into build/obj/
build:
    python3 tools/build.py

# Compare compiled functions with the original; show a diff for each SYMBOL
[positional-arguments]
compare *symbols: build _elf
    python3 tools/compare.py "$@"

# Check each MODULE's _BSS order against wcc386's layout rule (-v: details)
[positional-arguments]
bss *args:
    python3 tools/bss.py "$@"

# Set up build/game: the game files, the CD image and TOMB.EXE with src/ hooked in
game: build _elf
    mkdir -p build/game/TOMBRAID
    cd orig/tomb/TOMBRAID && cp DOS4GW.EXE HMIDET.386 HMIDRV.386 HMISET.CFG SETTINGS.DAT TOMB.SP ../../../build/game/TOMBRAID/
    for f in GAME.DAT GAME.GOG 02.mp3 03.mp3 04.mp3 05.mp3 06.mp3 07.mp3 08.mp3 09.mp3 10.mp3; do ln -sf "$PWD/orig/tomb/$f" build/game/; done
    python3 tools/patch_exe.py build/game/TOMBRAID/TOMB.EXE

# Run the hooked game headless in DOSBox with STEPS (wait:S key:K hold:K:S shot:NAME)
[positional-arguments]
run *steps: game
    python3 tools/play.py "$@"

# Run the unmodified original headless with STEPS
[positional-arguments]
run-orig *steps: game
    cp {{ exe }} build/game/TOMBRAID/ORIG.EXE
    python3 tools/play.py --exe ORIG.EXE "$@"

# Analyze the original with headless Ghidra; add new functions to symbols.csv
analyze: _elf
    python3 tools/functions.py > build/functions.csv
    tools/ghidra/analyze.sh
    python3 tools/seed_symbols.py

# Decompile ADDRs (default: every function) with Ghidra into build/decomp/
decompile *addrs:
    tools/ghidra/decompile.sh {{ addrs }}

# Render docs/progress.svg from symbols.csv and the build
progress: build _elf
    python3 tools/render_progress.py

# Remove build outputs (keeps the Ghidra project)
clean:
    rm -rf build/obj build/game build/shots build/tomb.*

# Flatten the original into build/tomb.elf
_elf: _orig
    python3 tools/le.py elf {{ exe }} build/tomb.elf

# Verify the original and copy it to build/
_orig:
    cd orig && sha1sum --quiet -c tomb.sha1
    mkdir -p build && cp orig/tomb/TOMBRAID/TOMBno3Dfx.EXE {{ exe }}
