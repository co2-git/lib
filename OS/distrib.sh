lib.OS.distrib() {
	while read line
	do
		if [[ "$line" == DISTRIB_ID=* ]]; then
			echo "$line" | cut -d= -f2;
		fi
	done < /etc/lsb-release;
}