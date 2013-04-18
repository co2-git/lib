<< lib.README
#name 		Text.bold
#nutshell	Display text in bold
#usage		lib Text.bold <text>
#story		lib Text.bold This text will be shown in bold
lib.README

lib.Text.bold(){
	str="$@"

	if [ ! "$str" ]
	then
		read str
	fi
	
	echo "$(tput bold)$str$(tput sgr0)"
}
