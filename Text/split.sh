lib.Text.split(){
	separator="$1"
	string="$2"
	php -r 'foreach (explode("'$separator'", "'$string'") as $_) echo $_.PHP_EOL;'
}