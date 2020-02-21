#!/bin/bash
# Внимание! Этот скрипт нужен для того, чтобы использовать ПК по технике томата. Этот скрипт запускается при запуске bspwm.
while :
do
	notify-send "Display will turn off in 30 minutes"
	sleep 1680
	notify-send "Display will turn off in 2 minutes for 5 minutes"
	sleep 120
	# an half hour

	xset -display :0.0 dpms force off 
	# turn off display
	sleep 300
	# 5 minutes
	xset -display :0.0 dpms force on 
	# turn on display
done
