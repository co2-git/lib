lib(){
	function="$1"
	shift

	file=$libPATH/${function/./\///}.sh
	method="lib.$function"

	#
	#	If method already exists no need to require file

	if type $method >/dev/null 2>&1
		then
		$method "$@"
	elif [ -f "$file" ] 
		then
		. $file
		
		if type $method >/dev/null 2>&1
			then
			$method "$@"
		fi
	fi
}