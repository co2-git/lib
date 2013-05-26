# http://unstableme.blogspot.com.es/2007/02/finding-unused-port.html
lib.ports.free() {
	Port=$(( 1024 + 1 ));
	while netstat -atwn | grep >/dev/null "^.*:${Port}.*:\*\s*LISTEN\s*$" 
	do
		Port=$(( ${Port} + 1 ));
	done
	echo "${Port}";
}