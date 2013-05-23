lib.hello() {
	lib Text color white '  * lib *' | lib Text bold;
	echo '  -------'
	echo
	
	lib Text color blue '  The elevator pitch' | lib Text bold;
	lib Text color orange '	lib is a bash framework packed with various helper functions
	and an importer so you can easily extend it modularly.';

	lib Text color blue '  Where is it on my workstation?' | lib Text bold;
	lib Text color orange '	'$lib_path;

	lib Text color blue '  Which version am I running?' | lib Text bold;
	lib Text color orange '	'$(lib version);

	lib Text color blue '  What are the most useful commands?' | lib Text bold;
	echo -n "$(lib Text color orange '	Display help>')";
	lib Text bold ' lib help';
	echo -n "$(lib Text color orange '	List lib functions>')"
	lib Text bold ' lib ls';

	lib Text color blue '  Where can I know more about lib?' | lib Text bold;
	lib Text color orange '	Visit us on github at https://github.com/co2-git/lib';
}