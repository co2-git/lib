lib.Text.split(){
	separator="$1";
	shift;
	if [ $# -eq 0 ]; then
		read -t 1 text;
	else
		local text="$@";
	fi
	array=(${text//$separator/ });
	echo "${array[@]}";
}