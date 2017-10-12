#!/bin/bash

HOME=/
PATH=/sbin:/bin:/usr/sbin:/usr/bin

#считать copyfile, folderto из конфига!!!!!

. /home/ilya/Eltex_school/linux8config
echo $copyfile
echo $folderto

##rsync --archive --one-file-system 
rsync --archive $copyfile --delete $folderto
cp --archive $copyfile $folderto