#!/bin/bash

#скрипт разбора логов для процессов

echo "script running.. "
sleep 1
echo "Enter any process you want to check:"
read any_proc
cd /var/log/
if [ -f $any_proc ]
	then
	echo " enter string to search in log:"
	read string
	grep "$string" "$any_proc"
fi
if [ -d $any_proc ] 
	then
	cd ./$any_proc
	ls -l
	echo " enter file: "
	read file_proc
	if [ ! -f $file_proc ] 
		then
		echo " err. file not exist."
	else
		cat $file_proc
	fi
fi 
if [ ! -e $any_proc ]
then
	echo "if you dont see next message, then your process not exist :)"
	grep  "$any_proc" "syslog"
fi
cd /home/ilya/
