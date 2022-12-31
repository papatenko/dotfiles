#!/bin/bash

: '	Instant command processes
'

# If connected to dock
if [[ ! $(xrandr | grep "DisplayPort-[0-9] connected") ]]; then
	# If the hour is after 8 am and before 9 pm
	hour=$(date +"%H")
	if [[ $hour -lt 21 && $hour -gt 8 ]]; then 
    redshift -O 7500K
	fi
fi

: '	Background Processes
		- disowns each process so it can move to the background
		- Using a text file because saving the file in VSCode keeps erasing my disown commands
		- NOTE: wc command does not count last line and doesnt count the first line as 0
'
# File for which processes are stored in
processes=~/scripts/startup/processList.txt 

# Number of lines present in processes file
numLines=$(wc -l < $processes) 
((numLines++))

# Starting index
i=1 

# While there's a next line within the text file
while [[ $i -le $numLines ]]; do 
    echo "$(head -$i $processes | tail +$i)"" & disown" | bash
    echo "Line $i's command worked"
    ((i++))
done

sleep 1 # Not sure why this script doesn't work without this line
