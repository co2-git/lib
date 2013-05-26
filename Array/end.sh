lib.Array.end() {
	if [ $# -eq 0 ]; then
		read -t 1 args;
		local args=( $args );
	else
		local args=( $@ );
	fi
	echo "${args[${#args[@]}-1]}";
}