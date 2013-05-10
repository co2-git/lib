<< lib.README
#name 		import.refresh
#nutshell	Refresh a library 
#usage		lib import.refresh <namespace> [<path>]
lib.README

lib.import.refresh(){
	namespace="$1"
	path="$2"
	file=/tmp/lib.ns.$namespace
}