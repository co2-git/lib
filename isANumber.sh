<< lib.README
#name 		isANumber
#nutshell	Tell if mixed is a number or not 
#usage		lib isANumber <mixed>
#story		lib isANumber 1234 # return 0 (true)
#story 		lib isANumber -12.5 # return 0 (true)
#story		lib isANumber alpha # return 1 (false)
lib.README

lib.isANumber(){
	[[ $1 == ?(-|\+)+([0-9.]) ]]
}