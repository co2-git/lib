lib.Process.kill() {
	[ $# -eq 0 ] && return 1;
	ps aux | grep "$1" | grep -v grep | while read line
	do
		echo $line
		#echo >&2 Killing $(echo "$line");
		#kill -9 $(echo "$line" | awk '{print $9}');
	done;
}