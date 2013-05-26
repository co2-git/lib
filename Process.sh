lib.Process(){
	if [ $# -eq 0 ]; then
		lib Process.list;
	else
		lib Process.$@;
	fi
}