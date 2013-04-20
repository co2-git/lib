<< lib.README
#name 		Array.in
#nutshell	Tell if needle is in stack
#usage		lib Array.in <needle> <stack...>
#story		lib Array.in 3 1 2 3 4 # return 0 (true)
#story		lib Array.in 7 1 2 3 4 # return 1 (false)
#story		lin Array.in /do/ cat dog fox # true, echo dog
lib.README

lib.Array.in(){
	needle=$1
	useRegex=0
	found=0
	shift
	if [[ "$needle" == /*/ ]]
		then
		useRegex=1
		needle=$(echo "$needle" | sed -e 's/^\/\(.\+\)\/$/\1/')
	fi
	for item
	do
		if [ $useRegex -gt 0 ]
			then
			if [[ "$item" =~ "$needle" ]]
				then
				(( found++ ))
				echo "$item"
			fi
		else
			if [ "$item" = "$needle" ]
				then
				(( found++ ))
				echo "$item"
			fi
		fi
	done

	if [ $found -gt 0 ]
		then
		return 0
	else
		return 1
	fi
}