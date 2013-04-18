<< lib.README
#name 		Array.count
#nutshell	Count items in stack
#usage		lib Array.count <needle> <stack...>
#story		lib Array.count 1 2 3 4 # echo 4
lib.README

lib.Array.count(){
	echo $#
}
