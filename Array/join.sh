lib.Array.join(){
	[ $# -lt 2 ] && return 1

	glue="$1"
	
	shift
	
	for a
	do
		j="$j$a$glue"
	done
	
	unset a

	echo "${j:0:(( ${#j} - ${#glue} ))}"
}
