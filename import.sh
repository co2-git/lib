lib(){
	local function="$1";
	shift;
	local file=$libPATH/${function//./\/}.sh;
	local method="lib.$function";

	#
	#	If method already exists no need to require file

	if type $method >/dev/null 2>&1; then
		$method "$@";
	elif [ -f "$file" ]; then
		. $file;
		if type $method >/dev/null 2>&1; then
			$method "$@";
		fi
	else
		echo lib\: Function not found\: $function
	fi
}