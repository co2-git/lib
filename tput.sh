lib.tput(){
	[ $# -eq 0 ] && {
		ls $libPATH/tput
		return 0
	}
	lib tput."$@"
}