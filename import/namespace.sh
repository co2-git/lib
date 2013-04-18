<< lib.README
#name 		import.namespace
#nutshell	Import a library following the lib importing model 
#usage		lib import.namespace <namespace> <path>
lib.README

lib.import.namespace(){
	namespace="$1"
	path="$2"

	echo 	$namespace'PATH="'$path'";' > /tmp/lib.ns.$namespace

	sed 's/lib/'$namespace'/' $libPATH/import.sh >> /tmp/lib.ns.$namespace

	echo /tmp/lib.ns.$namespace
}