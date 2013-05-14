<< lib.README
#name 		import.namespace
#nutshell	Import a library following the lib importing model 
#usage		lib import.namespace <namespace> <path>
lib.README

lib.import.namespace(){
	local namespace="$1"; shift;
	local path="$1"; shift;
	echo here;
	local default="$(lib Array after --default "$@")"
	echo if;
	echo 'readonly '$namespace'_path="'$path'";' > /tmp/lib.ns.$namespace
	if [ -n "$default" ]; then
		echo 'readonly '$namespace'_default="'$default'";' >> /tmp/lib.ns.$namespace;
	fi
	sed 's/lib/'$namespace'/g' $lib_path/import.sh >> /tmp/lib.ns.$namespace

	echo /tmp/lib.ns.$namespace
}