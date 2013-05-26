lib.man() {
	cat << INTRO
$(lib Text.bold lib' | v0.1.3') $(lib Text.color blue 'Need help? Type it :)')
INTRO
	read -p 'Search: ' search;

	if [ "$search" = 'help' -o "$search" = 'h' -o "$search" = '?' ]; then
		lib help;
		echo;
		lib.man;
	fi
}