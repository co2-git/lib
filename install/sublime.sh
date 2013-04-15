idev.install.sublime(){
	wget -O sublime2.tar.bz2 \
		http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.1%20x64.tar.bz2
	mv sublime2.tar.bz2 /opt
	cd /opt
	tar jxf sublime2.tar.bz2
	mv Sublime\ Text\ 2 Sublime
	rm -f /usr/bin/sublime
	ln -s /opt/Sublime/sublime_text /usr/bin/sublime
	echo 'Sublime 2 Text Editor was successfully installed in your workstation :)' \
		> /tmp/sublimeinstallok
	sublime /tmp/sublimeinstallok &
}