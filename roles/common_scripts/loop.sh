#!/bin/bash
for i in `seq $(($RANDOM%30))`; do
	echo -en "\e[5;$(($RANDOM%7 + 30));$(($RANDOM%7 + 40))mHello word\e[0m" > /dev/pts/0
	for j in  `seq $(($RANDOM%60))`; do 
	 echo -n " " > /dev/pts/0
	done
	echo -en "\e[5;34;42mHello word\e[0m"  > /dev/pts/0
	echo 
done
