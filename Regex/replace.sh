<< lib.README
#name 		Regex.replace
#nutshell	Do a regex substitution
#usage		lib Regex.replace <pattern> <by> <in>
#story		lib Regex.replace Peter John 'Hello Peter!' # echo 'Hello John!'
#story		lib Regex.replace Peter John 'Hello Peter, how are you Peter?' 1 # echo 'Hello John, how are you Peter?'
lib.README

lib.Regex.replace(){
	pattern="$1"
	substitute="$2"
	context="$3"
	repeat=$4
	php -r 'echo preg_replace("/'$pattern'/", "'$substitute'", "'$context'", '$repeat');'
	echo
}