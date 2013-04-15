idev.install.google-chrome(){
	user=$(whoami)
	if [ ! "$user" = root ]
		then
		echo You need to be root or sudo to install google-chrome
		return 1
	fi
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c \
	'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt-get update
	sudo apt-get install google-chrome-stable
	echo 'Google Chrome Stable was successfully installed in your workstation :)' \
		> /tmp/chromeinstallok
	google-chrome file:///tmp/chromeinstallok &
}