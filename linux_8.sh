#!/bin/bash

#HOME=/
#PATH=/sbin:/bin:/usr/sbin:/usr/bin

#периодичное резервное копирование в указанное место

function_cron()
{
	min=$1
	hour=$2
	day=$3
	month=$4
	dweek=$5
	if [ ! -e "/home/ilya/Eltex_school/linux8cron" ]
	then
		echo "crontab file is not exist"
	else
		echo "* * * * * sh /home/ilya/Eltex_school/linux8copy.sh" > /home/ilya/Eltex_school/linux8cron
		crontab /home/ilya/Eltex_school/linux8cron
	fi
}

echo "script reserve copy file with linux8config file"
echo "do you want to continue?(y/n) other key - remove reserve coping"

#считать min, hour, day, month, dweek из конфига!!!!!

. /home/ilya/Eltex_school/linux8config

read confirm
case $confirm in
	y)
		function_cron $min $hour $day $month $dweek;;
	n)
		exit 0;;
	*)
		crontab -r;;
esac
