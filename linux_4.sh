#!/bin/bash

#скрипт контролирует состояние процесса, и возобновляет его работу в случае прерывания

MAILT0=ilya
HOME=/
PATH=/sbin:/bin:/usr/sbin:/usr/bin
rm cron_prossesus
touch cron_prossesus
chmod 777 cron_prossesus

cron_add()
{	
	ps -la
	echo "set process name:"
	read proc_name
	echo " * * * * * /home/ilya/Eltex_school/linux_4.sh $proc_name" > cron_prossesus
	crontab cron_prossesus
}

processing_on()
{
	ret=$(pidof $1)
	error=$?
	echo "$error"            
	if [ "$error" -eq 1 ]
	then
		echo $@
		$@
	fi
        echo "done"
}

processing_off()
{
        crontab -r
        echo "Done. /nalarm successfully deleted."
}

edit_processing()
{
	vim cron_processus
	crontab cron_processus
	echo "success"
}

if [ "$#" -gt 0 ]
then
	processing_on $@
else

echo "enter any function [1 or 2]:"
echo " 1: add processing set;"
echo " 2: remove processing set;"
echo " 3: edit crontab."
read control
case $control in
        1)
         cron_add;;
        2)
         processing_off;;
		3)
	 	 edit_processing;;
        *)
         exit 0;;
esac                                                                               
fi
