<< lib.README
#name 		Array.after
#nutshell	Give the item after any occurences of needle
#usage		lib Array.after <needle> <stack...>
#story		lib Array.after 3 1 2 3 4 # echo 4
#story		lib Array.after /do/ dog cat # echo cat
lib.README

lib.Array.after(){
	needle="$1"
	shift

	useRegex=0
	if [[ "$needle" == /*/ ]]
		then
		useRegex=1
		needle=$(echo "$needle" | sed -e 's/^\/\(.\+\)\/$/\1/')
	fi

	array=( "$@" )
	if [ -z "$array" ]; then 
		read -t 0 array;
		if [ -n "$array" ]; then 
			lib.Array.after $array;
		fi
		return
	fi

	found=$((0))
	for (( i=0; i<${#array[@]}; i++ ))
	do
		local next=$(( i + 1 ))
		local item="${array[$i]}"
		if [ $useRegex -gt 0 ]; then
			if lib >/dev/null Regex.match "$needle" "$item"; then
				(( found ++ ))
				echo "${array[$next]}"
			fi
		else
			if [ "$item" = "$needle" ]; then
				(( found ++ ))
				echo "${array[$next]}"
			fi
		fi
	done

	if [ $found -eq 0 ]; then
		return 1
	else
		return 0
	fi
}