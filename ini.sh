lib.ini(){
	[ $# -eq 0 ] && {
		ls $libPATH/ini
		return 0
	}
	lib ini."$@"
}