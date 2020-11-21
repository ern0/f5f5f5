#!/bin/bash

BROWSER=Chromium
PERIOD=300
KEY=F5


if ! command -v xdotool; then
	echo "FATAL: not installed: xdotool"
	exit
fi

if ! command -v notify-send; then
	echo "FATAL: not installed: notify-send"
	exit
fi

while [ true ]; do
	
	WINDOW=$(xdotool search --class $BROWSER)
	if [ -z "$WINDOW" ]; then

		echo "Waiting for $BROWSER..."
		sleep 3

	else

		echo "Pressing $KEY for $BROWSER"
		sleep 1
		notify-send -t 300 reload
		xdotool windowactivate $WINDOW
		sleep 1
		xdotool key $KEY

		echo "Sleeping $PERIOD..."
		sleep $PERIOD

	fi

done