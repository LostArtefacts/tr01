#!/bin/sh
# Imports the flattened executable (build/<game.name>.elf, from `just
# analyze`) into a headless Ghidra project, with the functions of
# build/functions.csv and Watcom's register calling convention, and
# exports its function list. The names come from project.toml.
set -e
cd "$(dirname "$0")/../.."
project() { python3 tools/project.py "$@"; }
. tools/ghidra/env.sh
NAME=$(project get ghidra.project)
ELF=build/$(project get game.name).elf
FUNCTIONS=$(project get ghidra.functions)
mkdir -p build/ghidra
"$GHIDRA/support/analyzeHeadless" build/ghidra "$NAME" \
	-import "$ELF" -overwrite \
	-processor x86:LE:32:default -cspec gcc \
	-scriptPath tools/ghidra \
	-preScript Watcom.java \
	-postScript Watcom.java "$PWD/build/functions.csv" \
	-postScript ExportFunctions.java "$PWD/$FUNCTIONS" \
	> build/ghidra/analyze.log 2>&1
grep REPORT build/ghidra/analyze.log
