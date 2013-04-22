lib.Text(){
	[ $# -eq 0 ] && {
		ls $libPATH/Text
		return 0
	}
	lib Text."$@"
}