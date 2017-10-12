#!/bin/bash
#будильник
MAILT0=ilya
HOME=/
PATH=/sbin:/bin:/usr/sbin:/usr/bin
rm alarm_set
touch alarm_set
chmod 777 alarm_set
alarm_on()
{
	echo "set time (hh mm)"
	read h min
	echo "done"
	#Путь к мп3
	echo "$min $h * * * mplayer /home/ilya/Eltex_school/alarm/Mireille.mp3" > alarm_set
	crontab alarm_set
	echo "done"
}
alarm_off()
{
	crontab -r
	echo "Done. /nalarm successfully deleted."
}
echo "enter any function [1 or 2]:"
echo " 1: add alarm set;"
echo " 2: remove alarm set."
read control
case $control in
	1)
	 alarm_on;;
	2)
	 alarm_off;;
	*)
	 exit 0;;
esac

