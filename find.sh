lib.find() {
	case "$1" in
		free )
			shift;
			case "$1" in
				port )
					shift;
					lib Network.find-unused-port "$@";
					;;
			esac
			;;
	esac
}