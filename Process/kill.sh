lib.Process.kill() {
	[ $# -eq 0 ] && return 1;
	ps aux | grep "$1" | grep -v grep | while read line
	do
		kill -9 $(echo "$line" | awk '{print $2}')
	done;
}