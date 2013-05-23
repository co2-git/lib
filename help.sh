lib.help() {
	cat << HELP
$(lib Text color white '  * lib *' | lib Text bold) \
$(lib Text color blue ' help' | lib Text bold)
  -------

  	lib is a set of functions performing helpful actions. 
  	Functions are organized by namespaces. 
  	You can access a function by calling it as so: $(lib Text color green \
  		namespace.function). 
	For example, $(lib Text color blue lib Text.bold Hello world)

	$(lib Text color orange 'Which version of lib am I using?')
	$(lib Text color green 'lib version')

	$(lib Text color orange 'How can I see the list of all lib functions?')
	$(lib Text color green 'lib ls')
	$(lib Text color green 'lib ls namespaces') # See all namespaces
	$(lib Text color green 'lib ls ns=Array') # See all functions under namespace Array
	$(lib Text color green 'lib ls function=Array.join') # See a specific function
HELP
}