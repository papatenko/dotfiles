#!/bin/bash

: '	Commands that arent meant to run depending on the scenario
	(wont break the computer if ran multiple times)

	1) If connected to dock 
		(using any variation of DisplayPort connection to indicate)
		- connect to bluetooth devices
		- activate imwheel 
	2) If disconncted from dock 
		- deactivated imwheel
'

while :
do
	# If connected to dock
	if [[ $(xrandr | grep "DisplayPort-[0-9] connected") ]]; then

		# If imwheel not already active 
		# (process imwheel will already show up once due to grep)
		if [ $(ps aux | grep -o -i "imwheel 45" | wc -l) = 1 ]; then
			imwheel 45
		fi
	fi

	# If disconnected from dock
	if [[ ! $(xrandr | grep "DisplayPort-[0-9] connected") ]]; then
		pkill imwheel
	fi

	#1 second delay
	sleep 1 
done
