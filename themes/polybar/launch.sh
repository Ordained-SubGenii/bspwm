#!/usr/bin/env bash

# Terminate already running bar instances
while pgrep -u $UID -x polybar >/dev/null ; do
	pkill polybar
	sleep 0.5
done

# Launch Polybar
#mapfile -t monitors < <(polybar -m | cut -d":" -f1)

#for m in "${monitors[@]}"; do
while read m w; do
	MONITOR=$m width=$w polybar top -c ~/.config/bspwm/themes/polybar/config.ini >/dev/null 2>1 | tee /tmp/polybar.log & disown
done < <(polybar -m | awk -F[:,x] '{ print $1,$2 }') 
	#done < <(polybar -m | awk -F[:,x] '{ print $2 }')
#done
