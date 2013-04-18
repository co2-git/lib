<< lib.README
#name 		all
#nutshell	Show ALL lib functions 
#usage		lib all [--namespace|-n [<namespace>]] [<function>]
#story		lib all # less all lib documented functions
#story		lib all --namespace # less all lib documented namespaces
#story		lib all --namespace Array # less all functions in the Array namespace
#story		lib all Text.bold # less only documentation for bold function in Text namespace
lib.README

lib.all.view(){
	file="$1"
	if [ -z "$file" ]
		then
		read file
	fi
	doc=
 	while read line
	do
		if [ "$line" =  '<< lib.'README ]
			then
			continue
		elif [ ! "$line" = lib.'README' ]
			then
			doc="$doc 
$line"
		else
			break
		fi
	done << BASH
	$(cat "$file")
BASH

	echo "$doc"
}

lib.all(){
	if [ $# -eq 0 ]
		then
			echo 'lib - All' > /tmp/$$.lib.all
			grep -r '<< lib.''README' $libPATH | while read line
			do
				file="$(echo "$line" | cut -d: -f1)"
				lib.all.view "$file" >> /tmp/$$.lib.all
			done
			less /tmp/$$.lib.all
			unlink /tmp/$$.lib.all
	elif [ "$1" = '--namespace' -o "$1" = '-n' ]
		then
		if [ -n "$2" ]
			then
			namespace=$2
			echo 'lib - '$namespace > /tmp/$$.lib.$namespace
			grep -r '<< lib.''README' $libPATH/$namespace | while read line
			do
				file="$(echo "$line" | cut -d: -f1)"
				lib.all.view "$file" >> /tmp/$$.lib.$namespace
			done
			less /tmp/$$.lib.$namespace
			unlink /tmp/$$.lib.$namespace
		else
			ls $libPATH | while read ls
			do
				if [ -d "$libPATH/$ls" ]
					then
					echo $ls
				fi
			done
		fi
	else
		function=$1
		lib Regex.replace \\. / $libPATH/$function.sh 1 | lib.all.view | less
	fi
}