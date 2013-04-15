lib.csv.cut(){
	read csv
	
	separator="$(bm in_array_regex '^s' "$@")"

	[ -n "$separator" ] && separator=${separator:1} || separator=,
	
	csv="$(echo "$csv" | sed 's/,"/\n"/g' | sed 's/",/"\n/g')"
	
	OLDIFS="$IFS"
	IFS='
'
	lines=
	
	for line in $csv
	do
		[[ "$line" == '"'*'"' ]] && lines="$lines
$( echo "$line" | bm trim_quotes )" || { 
			IFS=$separator
			
			for hash in $line
			do
				lines="$lines
$hash"
			done
			
			IFS='
'
		}
	done
	
	IFS="$OLDIFS"
	
	lines="$(echo "$lines" | sed '1d')"
	
	index=$(bm in_array_regex ^h "$@") && echo "$lines" | sed -n $(( ${index:1} + 1 ))p || {
		bm in_array --count "$@" >/dev/null && echo "$lines" | wc -l || {
			echo "$lines"
		}	
	}
}
