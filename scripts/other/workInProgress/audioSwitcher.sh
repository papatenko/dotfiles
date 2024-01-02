#!/bin/bash

# Get the current default sink
current_sink=$(pactl info | grep 'Default Sink' | cut -d ' ' -f3)

# Define your devices
declare -a devices=("alsa_output.pci-0000_04_00.1.HiFi__hw_Generic_3__sink" "alsa_output.pci-0000_04_00.6.HiFi__hw_Generic_1__sink" "bluez_sink.30_82_16_8A_78_A7.a2dp_sink")

# Find the index of the current sink in the devices array
index=0
for i in "${!devices[@]}"; do
   if [[ "${devices[$i]}" = "${current_sink}" ]]; then
       index=$i
       break
   fi
done

# Increment the index (and wrap around if necessary)
index=$(( (index + 1) % ${#devices[@]} ))

# Set the new default sink
pactl set-default-sink ${devices[$index]}

