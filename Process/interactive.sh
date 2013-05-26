lib.Process.interactive() {
	cat << PROMPT

Choose which interactive view you want to run:

  $(lib Text bold top)

    Show the processes ordered by CPU or RAM consumption
    (very useful to spot a process that is taking too much memory)
    > Type q to quit top
  
  $(lib Text bold htop)

    A very detailed interface of all the processes
    (tip: Hit l to see full details about a process)
    > Type q to quit htop


PROMPT
	read -p 'Your choice? ' choice;
	case "$choice" in
		top | htop )
			$choice;
			;;
		* )
			echo Quitting. No action taken;
			exit 1;
			;;
	esac
}