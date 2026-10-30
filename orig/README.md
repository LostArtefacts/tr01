# orig/

Put your own copy of the game here. Nothing in this directory except this
file and the `.sha1` list is tracked.

The target is the DOS `TOMB.EXE` from the original retail CD, dated
1996-10-30. The GOG and Steam releases ship it, under DOSBox, as
`TOMBRAID/TOMBno3Dfx.EXE`, and carry the CD as a raw image, `GAME.GOG`
with `GAME.DAT` as its cue sheet. Copy the whole install directory:

```
orig/tomb/                         the GOG or Steam install directory
orig/tomb/TOMBRAID/TOMBno3Dfx.EXE  the retail TOMB.EXE
orig/tomb/GAME.GOG                 the CD image, 2352-byte sectors
orig/tomb/GAME.DAT                 its cue sheet
orig/tomb/02.mp3 ... 10.mp3        the CD audio tracks
```

```sh
cd orig && sha1sum -c tomb.sha1
```

| File | SHA-1 |
| --- | --- |
| `TOMBno3Dfx.EXE`, the retail `TOMB.EXE` | `05e5483bec20a6fa63d9f38c1f090b0b665ebcc8` |
| `tomb.exe`, the 1997 Voodoo patch (not targeted) | `d529cc23cbae8dacfe1de6a7bf6c6efe6fe1d5b6` |

## Compiler

Watcom C/C++ 10.6, which is not redistributable. Point `WATCOM` at a
directory holding the `BINNT`, `H` and `LIB386` directories of its CD,
or add the directory to `build.watcom` in `project.toml`, the list of
places searched without it:

```sh
7z x -o"$HOME/opt/watcom10.6" watcom10.6.iso BINNT H LIB386
export WATCOM=$HOME/opt/watcom10.6
```

## Assembler

MASM 6.11, which is not redistributable either. Point `MASM` at a
directory holding its `ML.EXE` (expanded from the install disks with
the disks' `DECOMP.EXE`), or add the directory to `build.masm` in
`project.toml`; `~/opt/masm611` is already there.

## DOSBox

`just run` needs dosbox-staging (0.83.0 works). `DOSBOX` is its binary;
without it, the first match of `dosbox.search` in `project.toml` is
used, which finds the release tarball unpacked to `~/opt/` or
`~/data.local/work/`.

## Ghidra

`just analyze` and `just decompile` need Ghidra and a JDK 21. `GHIDRA`
is its installation directory; without it, the first match of
`ghidra.search` in `project.toml` is used. A `jdk-21*` next to it is
used when there is no `java` on the `PATH`.
