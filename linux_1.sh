#!/bin/bash
#скрипт создает а папок, в каждой из них б подпапок, в каждой подпапке с пустых файлов с заданным шаблоном имени
if [ "$#" -ne 5 ] || [ ! -d "$1" ]
then
	echo "id10t!"
else
	cd "$@"
	for i in `seq 1 $2`;
	do
		if [ ! -e "./$5$i" ]
		then
			mkdir "$5$i"
		fi
		cd "./$5$i"
		for j in `seq 1 $3`;
		do
			if [ ! -e "./$5$i$j" ]
			then
				mkdir "$5$i$j"
			fi
			cd "./$5$i$j"
			for k in `seq 1 $4`;
			do
				if [ ! -e "./$5$i$j$k" ]
				then
					touch "$5$i$j$k"
				fi
			done
			cd ..
		done
		cd ..	
	done
fi
