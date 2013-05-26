lib.Process.list() {
	case "$1" in
		users )
			# http://www.commandlinefu.com/commands/view/5480/processes-per-user-counter
			ps hax -o user | sort | uniq -c;
			;;
		* )
			local user="$(lib Array after '/(-u|--user)/' "$@")";
			if [ -n "$user" ]; then
				pgrep -l -u $user
			else
				ps aux;
			fi
			;;
	esac
}