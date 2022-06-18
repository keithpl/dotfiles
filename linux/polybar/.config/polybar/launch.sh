#!/usr/bin/env bash

killall -q polybar

while pgrep -x polybar > /dev/null; do sleep 0.25; done

screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d " " -f 6)

for i in $screens; do
	MONITOR=$i polybar main &
done
