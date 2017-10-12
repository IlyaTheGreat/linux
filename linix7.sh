#!/bin/bash
# настройщик правил для фаерволла
functionAdd()
{
	k=$1
	echo $k
	port=$(awk -v k="$k" -F" " '{printf $k}' /home/ilya/rules)
	echo $port
	sudo ufw allow "$port"
}
sudo ufw enable
dpkg -l | grep "ftp"
if [ $? -eq 0 ]
	then
	echo "opening port 21 for ftp..."
	sudo ufw allow 21
	echo "done"
fi
dpkg -l | grep "ssh"
if [ $? -eq 0 ]
	then
	echo "opening port 22 for ssh..."
	sudo ufw allow 22
	sleep 1
	echo "done"
fi
dpkg -l | grep "telnet"
if [ $? -eq 0 ]
	then
	echo "opening port 23 for telnet"
	sudo ufw allow 23
	sleep 1
	echo "done"
fi
numOfPorts=11
rm /home/ilya/rules
 touch /home/ilya/rules
# echo $(netstat -lptun --numeric-ports) >> /home/ilya/rules
# awk /\:[0-9]+$/ /home/ilya/rules
echo $(netstat -lantp | grep LISTEN | awk -F: '{printf $2"\n"}' | awk -F" " '{printf $1" "}')  >> /home/ilya/rules
for j in `seq 1 $numOfPorts`;
do
	functionAdd $j
done
