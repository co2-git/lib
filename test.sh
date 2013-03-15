lib.test2(){
	echo Hello World\!
	echo Arguments\: $#
	
	if [ $# -gt 0 ]
		then
		incrementer=$((0))
		
		for arg
		do
			echo \	[$incrementer] $arg
			incrementer=$(( $incrementer + 1 ))
		done
	fi
}

lib.test(){
	time lib.test2 "$@"
}