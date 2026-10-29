# Sourced by the Ghidra scripts. GHIDRA defaults to ~/opt/ghidra_* or
# ~/data.local/work/ghidra_*, JAVA_HOME to a jdk-21* next to it.
GHIDRA=${GHIDRA:-$(ls -d ~/opt/ghidra_* ~/data.local/work/ghidra_* 2>/dev/null | tail -1)}
if [ -z "$JAVA_HOME" ] && ! command -v java >/dev/null; then
	JAVA_HOME=$(ls -d "$(dirname "$GHIDRA")"/jdk-21* 2>/dev/null | tail -1)
	export JAVA_HOME PATH="$JAVA_HOME/bin:$PATH"
fi
