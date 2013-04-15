idev.install.git(){
	wget -O /tmp/build.git https://raw.github.com/co2-git/build/master/git/build
	chmod +x /tmp/build.git
	/tmp/build.git --into /opt
	rm /tmp/build.git
}