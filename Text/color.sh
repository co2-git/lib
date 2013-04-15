lib.Text.color(){
	color=$(lib tput.get-color-number "$1")
	
	[ $# -eq 1 ] && read msg || {
		shift
		msg="$@"
	}
	
	echo "$(tput setf $color)$msg$(tput sgr0)"
}
