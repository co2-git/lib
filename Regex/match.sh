lib.Regex.match(){
	pattern="$1"
	context="$2"
	match=$(php -r 'echo (string) preg_match("/'$pattern'/", "'$context'");')
	echo $match
	if [ $match -eq 0 ]; then
		return 1
	else
		return 0
	fi
}