<< lib.README
#name 		Function.exists
#nutshell	Tell if there is a function named function
#usage		lib Function.exists <function>
#story		lib Function.exists cd # 0
lib.README

lib.Function.exists(){
	type -t $1
}