<< lib.README
#name 		Array.in
#nutshell	Tell if needle is in stack
#usage		lib Array.in <needle> <stack...>
#story		lib Array.in 3 1 2 3 4 # return 0 (true)
#story		lib Array.in 7 1 2 3 4 # return 1 (false)
#story		lin Array.in /do/ cat dog fox # true, echo dog
lib.README

lib.Array.in(){
	#	Local variables
	local needle="$1"; shift;
	local useRegex=0;
	local found=0;
	#	If needle is a regex
	if [[ "$needle" == /*/ ]]; then
		useRegex=1;
		needle=$(echo "$needle" | sed -e 's/^\/\(.\+\)\/$/\1/');
	fi
	#	Read from stdin if in pipe
	if [ $# -eq 0 ]; then
		read -t 1 stack;
		stack=( $stack );
	else
		local stack=( "$@" );
	fi
	#	Loop each item to find a match
	for item in "${stack[@]}"
	do
		#	For regex search
		if [ $useRegex -gt 0 ]; then
			if lib >/dev/null Regex match "$needle" "$item"; then
				(( found++ ));
			fi
		#	For normal search
		elif [ "$item" = "$needle" ]; then
			(( found++ ));
		fi
	done
	#	Print number of matches found
	echo $found;
	#	Exit true or false
	if [ $found -gt 0 ]; then
		return 0;
	else
		return 1;
	fi
}