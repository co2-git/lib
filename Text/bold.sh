lib.Text.bold(){
	str="$@"

	if [ ! "$str" ]
	then
		read str
	fi
	
	echo "$(tput bold)$str$(tput sgr0)"
}
