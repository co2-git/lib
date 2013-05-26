lib.Process.kill() {
	[ $# -eq 0 ] && return 1;
	if lib isANumber "$1"; then
		kill -9 "$1";
	else
		pkill "$1";
	fi
}