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
