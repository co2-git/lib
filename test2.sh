lib.test2() {
	application="$1"
	
	shift
	
	"$application" << @
$($@)
@
}
