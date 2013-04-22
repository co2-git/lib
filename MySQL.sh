lib.MySQL(){
	[ $# -eq 0 ] && {
		ls $libPATH/MySQL
		return 0
	}
	lib MySQL."$@"
}