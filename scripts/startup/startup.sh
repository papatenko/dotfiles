#!/bin/bash

hour=$(date +"%H")

processes=~/scripts/startup/processList.txt #File for which processes are stored in

numLines=$(wc -l < $processes) #Number of lines present in processes file
((numLines++))

i=1 #Starting index

#Creates directory if they are not present
dirs=("sync" "memez" "wallpapers"
    "projects" "projects/randomWebsites" "projects/odin" "projects/other")
for dir in "${dirs[@]}"; do
    [ ! -d ~/$dir ] && mkdir ~/$dir
done

: '	Instant command processes
'

# If connected to dock
if [[ ! $(xrandr | grep "DisplayPort-[0-9] connected") ]]; then
	# If the hour is before 9 pm or after 8 am (when night color is on)
	if [[ $hour -lt 21 && $hour -gt 8 ]]; then
		redshift -O 7500K
	fi
fi

: '	Background Processes
		- disowns each process so it can move to the background
		- Using a text file because saving the file in VSCode keeps erasing my disown commands
		- NOTE: wc command does not count last line and doesnt count the first line as 0
'

# While there's a next line within the text file
while [[ $i -le $numLines ]]; do
    echo "$(head -$i $processes | tail +$i)"" & disown" | bash
    echo "Line $i's command worked"
    ((i++))
done

: '	One Time Commands
		- changes color temperature
'

sleep 1 # not sure why this script doesn't work without this line
