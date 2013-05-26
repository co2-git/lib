lib.ports() {
	case "$1" in
		#	Return a free port number
		free )
			lib Network.find-unused-port
			;;
		* )
			#	Get list of free ports
			local netstat="$(netstat 2>/dev/null -tulpn)";
			local lines=();
			local columns=( $(lib Array after --columns "$@" | lib Text split ,) );
			if ! lib >/dev/null Regex match '\-\-' "$@" ||
				lib >/dev/null Regex match '\-\-columns' "$@"; then
				for (( i=1; i<=$(echo "$netstat" | wc -l); i++ ))
				do
					lines+=($i);
				done
			else
				#	Get pid
				local pid="$(lib Array after --pid "$@")";
				if [ -n "$pid" ]; then
					while read line
					do
						lines+=( $line );
					done << BASH
$(echo "$netstat" | grep -n $pid | cut -d: -f1)
BASH
				fi
				#	Get port number
				local port="$(lib Array after --port "$@")";
				if [ -n "$port" ]; then
					while read line
					do
						lines+=( $line );
					done << BASH
$(echo "$netstat" | grep -n ':'$port | cut -d: -f1)
BASH
				fi
				#	Get command
				local command="$(lib Array after --command "$@")";
				if [ -n "$command" ]; then
					while read line
					do
						lines+=( $line );
					done << BASH
$(echo "$netstat" | grep -n  /$command | cut -d: -f1)
BASH
				fi
				#	Get protocol
				local protocol="$(lib Array after --protocol "$@")";
				if [ -n "$protocol" ]; then
					while read line
					do
						lines+=( $line );
					done << BASH
$(echo "$netstat" | grep -n $protocol | cut -d: -f1)
BASH
				fi
				#	Get IP version
				local ipv="$(lib Array after --ipv "$@")";
				if lib >/dev/null isANumber "$ipv"; then
					case "$ipv" in
						4 )
							while read line
							do
								lines+=( $line );
							done << BASH
$(echo "$netstat" | egrep -n '(tcp\s)|(udp\s)' | cut -d: -f1)
BASH
							;;
						6 )
							while read line
							do
								lines+=( $line );
							done << BASH
$(echo "$netstat" | egrep -n '(tcp6)|(udp6)' | cut -d: -f1)
BASH
							;;
					esac
				fi
			fi

			local liner=$((1));
			while read line
			do
				if lib >/dev/null Regex match ':' "$line"; then
					if lib >/dev/null Array has $liner "${lines[@]}"; then
						local protocol="$(echo "$line" | cut -d' ' -f1)";
						local local_address="$(echo "$line" | awk '{ print $4 }')";
						local local_ip="$(echo "$local_address" | cut -d: -f1)";
						local local_port="$(lib Text split ':' "$local_address" | lib Array end)";
						local foreign_address="$(echo "$line" | awk '{ print $5 }')";
						local foreign_ip="$(echo "$foreign_address" | cut -d: -f1)";
						local foreign_port="$(echo "$foreign_address" | cut -d: -f2)";
						local pid="$(echo "$line" | awk '{ print $7 }' | cut -d/ -f1)";
						local command="$(echo "$line" | awk '{ print $7 }' | cut -d/ -f2)";

						if [ ${#columns[@]} -eq 0 ]; then
							echo "$line";
						else
							print="";
							for column in "${columns[@]}"
							do
								case "$column" in
									pid )
										if lib >/dev/null isANumber "$pid"; then
											print="$print$pid	";
										else
											print="${print}--	";
										fi
										;;
									port )
										if lib >/dev/null isANumber "$local_port"; then
											print="$print$local_port	";
										else
											print="${print}--	";
										fi
										;;
									command )
										if [ -n "$command" ]; then
											print="$print$command	";
										else
											print="${print}--	";
										fi
										;;
									protocol )
										if [ -n "$protocol" ]; then
											print="$print$protocol	";
										else
											print="${print}--	";
										fi
										;;
								esac
								#print="$print$column	";
							done
							echo "$print";
						fi
					fi
				fi
				(( liner++ ));
			done << BASH
$netstat
BASH
			;;
	esac
}