function timer() {
	count_s="$(($1 * 60))"
	count_m="$1"
	message="$2"
	the_date=$(date)
	echo "$the_date - Set timer for $count_m min. ($count_s seconds.)"
	echo ""
	while [  $count_m -gt 0 ]; do
		printf "\033[1A"  # move cursor one line up
		printf "\033[K"   # delete till end of line
	    echo "$count_m minutes left..."
	    let count_m=count_m-1 
	    sleep 60
	done

	osascript -e 'display notification "The timer you set is finished." with title "$message" subtitle "Times up sucka..." sound name "Purr"'
	curl -X POST http://textbelt.com/text -d number=5408458516 -d "message=$message"

	for i in `seq 1 2`; do
		say "$message"
    done 
	echo "Timer finished"
}
