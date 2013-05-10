lib.Process(){
	[ $# -eq 0 ] && {
		ls $libPATH/Process
		return 0
	}
	lib Process."$@"
}