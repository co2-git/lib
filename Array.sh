lib.Array(){
	[ $# -eq 0 ] && {
		ls $libPATH/Array
		return 0
	}
	lib Array."$@"
}