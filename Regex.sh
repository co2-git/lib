lib.Regex(){
	[ $# -eq 0 ] && {
		ls $libPATH/Regex
		return 0
	}
	lib Regex."$@"
}