export WINEPREFIX := justfile_directory() / ".wine"
export WINEDEBUG := env("WINEDEBUG", "-all")

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

# Set up build/game: the game files, the CD image and the exe with src/ hooked in
game: build _elf
    python3 tools/project.py game

# Run the hooked game headless in DOSBox with STEPS (wait:S key:K hold:K:S shot:NAME)
[positional-arguments]
run *steps: game
    python3 tools/play.py "$@"

# Run the unmodified original headless with STEPS
[positional-arguments]
run-orig *steps: game
    python3 tools/play.py --orig "$@"

# Analyze the original with headless Ghidra; add new functions to symbols.csv
analyze: _elf
    python3 tools/functions.py > build/functions.csv
    tools/ghidra/analyze.sh
    python3 tools/seed_symbols.py

# Decompile ADDRs (default: every function) with Ghidra into build/decomp/
decompile *addrs:
    tools/ghidra/decompile.sh {{ addrs }}

# Render docs/progress.svg from symbols.csv and the build, and print a summary
progress: build _elf
    python3 tools/render_progress.py

# Remove build outputs (keeps the Ghidra project)
clean:
    python3 tools/project.py clean

# Flatten the original into build/<game.name>.elf
_elf: _orig
    python3 tools/le.py elf

# Verify the original and copy it to build/
_orig:
    python3 tools/project.py orig
