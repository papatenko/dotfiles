#!/bin/bash
MAC="30:82:16:8A:78:A7"
connected () {
    echo "info $MAC" | bluetoothctl | grep "Connected" | cut -d " " -f 2
}
if [ $(connected) = yes ]; then
    echo "disconnect $MAC" | bluetoothctl
    echo "The device has been disconnected."
else
    bluetoothctl connect $MAC 
    echo "The device has been connected."
fi


