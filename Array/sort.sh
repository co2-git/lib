lib.Array.sort(){
	declare -a sorta
	
	sorta=( $@ )
	
	lib Array.join '
' $@ | sort
}
