#!/bin/bash
echo "script running.."
sleep 1
echo "enter folder"
read folder
sudo mount -t nfs -O uid=1000,iocharset=utf-8 192.168.1.6:/date ~/$folder