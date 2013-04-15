lib.MySQL.escape(){
	quote='"'
	
	lib Array.next -q "$@" >/dev/null && quote=$BM_ECHO
	
	[ "$quote" = "'" -o "$quote" = '"' ] || return 1
	
	echo "$1" | sed s/$quote/'\\'$quote/g
}
