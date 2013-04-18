<< lib.README
#name 		Text.color
#nutshell	Display text in given color
#usage		lib Text.color <color> <text>
#story		lib Text.color red This text will be displayed in red
lib.README

lib.Text.color(){
	color=$(lib tput.get-color-number "$1")
	
	[ $# -eq 1 ] && read msg || {
		shift
		msg="$@"
	}
	
	echo "$(tput setf $color)$msg$(tput sgr0)"
}
