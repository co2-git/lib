lib.OS.release() {
	while read line
	do
		if [[ "$line" == DISTRIB_RELEASE=* ]]; then
			echo "$line" | cut -d= -f2;
		fi
	done < /etc/lsb-release;
}