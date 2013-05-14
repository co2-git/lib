lib.OS.codeName() {
	while read line
	do
		if [[ "$line" == DISTRIB_CODENAME=* ]]; then
			echo "$line" | cut -d= -f2;
		fi
	done < /etc/lsb-release;
}t