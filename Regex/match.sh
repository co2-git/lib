lib.Regex.match(){
	local pattern="$1"; shift;
	if [ $# -eq 0 ]; then
		read -t 1 context;
		if [ -z "$context" ]; then
			return 2;
		fi
	else
		local context="$@";
	fi
	echo "$context" | egrep -c "$pattern";
}