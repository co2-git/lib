# http://unstableme.blogspot.com.es/2007/02/finding-unused-port.html
lib.Network.find-unused-port() {
	Port=3000
	while netstat -atwn | grep "^.*:${Port}.*:\*\s*LISTEN\s*$" 
	do
	Port=$(( ${Port} + 1 ))
	done
	echo "${Port}"
}