# tr01

A matching decompilation of Tomb Raider (Core Design, 1996), the DOS
version, built and verified on Linux through Wine.

The goal is C source that compiles into the original machine code and
links into a DOS executable that runs the game. During development,
recovered functions can also replace code in a copy of the original.

![Progress](docs/progress.svg)

## Sources

This is not a clean-room project. Core's game source, as later ported to
Windows, provides names, structures and logic. The source here is written
to match the DOS binary, which differs from that port in many places.
Ghidra provides disassembly and pseudocode for the original executable.

## Target

The retail `TOMB.EXE`, dated 1996-10-30, shipped by GOG and Steam as
`TOMBRAID/TOMBno3Dfx.EXE`.

| Property | Value |
| --- | --- |
| Format | 32-bit LE, DOS/4GW extender |
| Entry point | `0x4a574` |
| Code object | `0x10000`, size `0x7fa3e` |
| 16-bit code | `0x90000` |
| Stack and small data | `0xa0000` and `0xb0000` |
| Data object | `0xc0000`, size `0x808e0`, mostly zero-initialized |
| Game code | `0x10010`–`0x46e00` |

Game code starts with `OUTPUT`, with modules in source order. Watcom's C
library, the Escape FMV player, VGA/VESA code and HMI sound library follow.
The standalone executable links 156 library modules from Watcom's
`CLIB3R.LIB`, `MATH387R.LIB` and `EMU387.LIB`, in the order recorded in
`project.toml`. Code not yet supplied by `src/` is taken from the original.

Game files are not distributed. Supply your own copy; see
[`orig/README.md`](orig/README.md).

## Toolchain

| Component | Version or configuration |
| --- | --- |
| Compiler | Watcom C/C++ 10.6, `wcc386` |
| C flags | `-bt=dos -5r -oneatx` |
| Assembler | Microsoft MASM 6.11, `ml /c /Cp` |
| Runtime | DOS/4GW |
| Emulator | dosbox-staging |

The C library identifies Watcom 10.6: fingerprinting `CLIB3R.LIB` and
`MATH387R.LIB` finds 199 functions from 10.6 against 188 from 10.5. Where
the versions differ, 13 functions match 10.6 and two match 10.5.

The flags select register calling conventions, Pentium scheduling,
speed optimizations, relaxed alias checking and floating-point
transformations. Compiling the reference with different flags gives:

| Flags | Functions matching the original |
| --- | ---: |
| `-3r -ox` | 37 |
| `-5r -ox` | 97 |
| `-5r -oaxt` | 211 |
| `-5r -oneatx` | 222 |

MASM reproduces the original instruction encodings; Watcom's WASM can
encode equivalent instructions differently. Compiler, assembler,
libraries and backend settings are configured in `project.toml`.

## Setup

Clone with submodules, or run `git submodule update --init`.
Requirements: Python 3.11+, `just`, Wine, Watcom C/C++ 10.6, MASM 6.11,
Ghidra, Java 21 and dosbox-staging. Headless play also uses Xvfb, xdotool
and ImageMagick.

Supply the game and CD image as described in `orig/README.md`.
Tool locations are configured in `project.toml`; `WATCOM`, `MASM`,
`GHIDRA` and `DOSBOX` can override their searches. Game files, references
and build outputs are local dependencies rather than repository contents.

## Workflow

| Command | Purpose |
| --- | --- |
| `just analyze` | Flatten the LE, analyze it in Ghidra and record function sizes |
| `just decompile ADDRESS` | Export Ghidra pseudocode |
| `just compare [NAME]` | Build and check byte parity; optionally show a function diff |
| `just bss` | Check module layouts for uninitialized globals |
| `just progress` | Rebuild the progress chart |
| `just game` | Prepare the original with compiled functions hooked in |
| `just run wait:20 key:Return shot:menu` | Run in DOSBox and capture a screenshot |
| `just run-orig` | Run the unmodified original |
| `just exe` | Link the standalone executable |

Write C89 or assembly in `src/`, following the original module layout.
Record addresses and symbols in `config/symbols.csv`: `Name_` for Watcom
functions, `_name` for data. Comparison checks instruction bytes,
relocations and referenced literals. Functions listed in
`config/nonmatching.txt` appear red in the progress chart and are hooked
into the game along with matching functions.

Header declaration order affects Watcom's layout of uninitialized
globals. `just bss` predicts that layout and compares it with the original;
see `tools/bss.py` for the ordering rule.

The build tools are a submodule of
[decomp-tools](https://github.com/LostArtefacts/decomp-tools), shared with
other Tomb Raider decompilations. `just` lists all available commands.
