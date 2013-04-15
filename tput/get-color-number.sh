lib.tput.get-color-number(){
	color="$1"
	
	case $color in
		(red)
			echo "4"
		;;
		(grey)
			echo "7"
		;;

		(white)
			echo "7"
		;;

		(black)
			echo "0"
		;;
		(blue)
			echo "1"
		;;
		(green)
			echo "2"
		;;
		(teal)
			echo "3"
		;;
		(purple)
			echo "5"
		;;
		(orange)
			echo "6"
		;;
	esac
}
