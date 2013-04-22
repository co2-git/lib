lib.Function(){
	[ $# -eq 0 ] && {
		ls $libPATH/Function
		return 0
	}
	lib Function."$@"
}