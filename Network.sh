lib.Network(){
	[ $# -eq 0 ] && {
		ls $libPATH/Network
		return 0
	}
	lib Network."$@"
}