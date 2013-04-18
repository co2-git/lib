<< lib.README
#name 		MySQL.escape
#nutshell	Escape a value for MySQL
#usage		lib MySQL.escape <value>
#story		lib MySQL.escape 1'1 # echo 1\\\'1
lib.README

lib.MySQL.escape(){
	quote='"'
	
	lib Array.next -q "$@" >/dev/null && quote=$BM_ECHO
	
	[ "$quote" = "'" -o "$quote" = '"' ] || return 1
	
	echo "$1" | sed s/$quote/'\\'$quote/g
}
