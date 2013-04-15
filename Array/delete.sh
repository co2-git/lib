lib.Array.delete(){
	index=$1
	shift
	declare -a newArray
	i=$((0))

	for item
	do
		if [ $i -ne $index ]
			then
			newArray=( "${newArray[@]}" "$item")
		fi
		(( i++ ))
	done

	echo "${newArray[@]}"

	return
	array="$3"
	
	[ -z "$3" ] && exit
	
	declare -a stack stack2
	
	eval 'stack=${'$array'[@]}'
	
	for item in ${stack[@]}
	do
		[ "$item" = "$1" ] || stack2=( "${stack2[@]}" $item )
	done
	
#	echo ${stack2[@]}

	eval $array'=( "${stack2[@]}" )'
}
