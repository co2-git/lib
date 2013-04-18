<< lib.README
#name 		Array.sort
#nutshell	Sort naturally all items in stack
#usage		lib Array.sort <stack...>
#story		lib Array.sort 2 4 3 1 # echo 1 2 3 4
lib.README

lib.Array.sort(){
	declare -a sorta
	
	sorta=( $@ )
	
	lib Array.join '
' $@ | sort
}
