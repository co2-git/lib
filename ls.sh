lib.ls() {
	if [ $# -eq 0 ]; then
		find $lib_path | grep -v .git | sort | while read line
		do
			if [[ "$line" == *.sh ]]; then
				echo 	$line				| 
				sed 	's|'$lib_path'/||' 	|
				sed		's/.sh$//'			|
				sed		's|/|.|';
			fi
		done;
	else
		if [ "$1" = namespaces ]; then
			find $lib_path/* -type d | grep -v git | sort | sed 's|'$lib_path'/||';
		elif [[ "$1" == ns=* ]]; then
			ns="$(echo "$1" | cut -d= -f2)";
			find $lib_path/$ns/* | grep -v git | sort | sed 's|'$lib_path'/'$ns'/||' |
				sed	's/.sh$//';
		fi
	fi;
}