<< lib.README
#name 		Array.join
#nutshell	Join all items in stack using glue
#usage		lib Array.join <glue> <stack...>
#story		lib Array.join , 1 2 3 4 # echo 1,2,3,4
lib.README

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
