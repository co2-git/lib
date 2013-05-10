lib(){
	local lib_function="$1"; shift;
	if [[ -z "$lib_function" && -n "$lib_default" ]]; then
		lib_function="$lib_default";
	fi
	local lib_file=$lib_path/${lib_function//./\/}.sh;
	local lib_method="lib.$lib_function";

	#
	#	If method already exists no need to require file

	if type $lib_method >/dev/null 2>&1; then
		$lib_method "$@";
	elif [ -f "$lib_file" ]; then
		source $lib_file;
		if type $lib_method >/dev/null 2>&1; then
			$lib_method "$@";
		else
			echo lib\: Function ${lib_function} not in file;
			return 1;
		fi
	else
		echo lib\: File not found\: ${lib_file} ;
		return 1;
	fi
}