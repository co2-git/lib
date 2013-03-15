lib.Array.after(){
	after="$1" 
	shift

	declare -a array

	array=( "$@" )

	if [ -z "$array" ]
		then read array
		lib.Array.after $array
		return
	fi

	found=1

	for item in "${array[@]}"
	do
		[ $found -eq 0 ] && {
			echo "$item"
			return $found
		}

		[ "$item" = "$after" ] && {
			found=0
		}
	done

	return $found
}