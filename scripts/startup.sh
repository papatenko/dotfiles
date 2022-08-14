#!/bin/bash

processes=~/scripts/processes.txt #File for which processes are stored in
numLines=$(wc -l < $processes) #Number of lines present in processes file
hour=$(date +"%H")
((numLines++))
i=1 #Starting index

#Creates directory if they are not present
dirs=("sync" "memez" "compSciProjects" "wallpapers") 
for dir in "${dirs[@]}"; do
    [ ! -d ~/$dir ] && mkdir ~/$dir
done

: 'Runs a bunch of background processes
- disowns each process so it can move to the background and the next process can move to the foreground 
- Using a text file because saving the file in VSCode keeps erasing my disown commands at the end of each line 
- wc command does not count last line for some reason, does not count the first line as 0 either so...
'

# While there's a next line within the text file
while [ $i -le $numLines ]; do
    echo "$(head -$i $processes | tail +$i)"" & disown" | bash
    echo "Line $i's command worked"
    ((i++))
done

: 'Runs a bunch of commands and runs extra commands if my monitor of choice is plugged in on startup.
- (activated if DisplayPort-3 is connected, in my case, that means its connected to my docking station where mouse and keyboard is also connected)
- Will know by taking the input of the xrandr command, if the input doesnt return null using the z flag, then we know the monitor is connected
'

sleep 1
redshift -O 7500K

# If DisplayPort-3 is plugged in (xrandrOutput has any value to it)
if [[ -n "$(xrandr | grep "DisplayPort-3 connected")" ]]; then

# If the hour is before 10 pm or after 8 am (when nigh color is turned on to reduce blue light) 	
    if [[ $hour < 22 && $hour > 8 ]]; then
    	redshift -x
    fi
    imwheel 45
fi
