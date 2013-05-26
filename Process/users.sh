lib.Process.users() {
	if [ $# -eq 0 ]; then
		ps hax -o user | sort | uniq -c | while read user
		do
			local user_count="$(echo "$user" | cut -d' ' -f1)";
			local user_name="$(echo "$user" | cut -d' ' -f2)";
			echo "  $user_name ($user_count)";
			pgrep -l -u $user_name | while read line
			do
				echo "    $line";
			done
		done;
	else
		pgrep -l -u $1;
	fi
}