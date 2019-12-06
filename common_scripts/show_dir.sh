#!/bin/bash
while : ; do
	sleep 5
	echo  -e "\n\e[7;34m`ip a | sed -nr 's#.*(172\.20\.1\...).*#\1#p'`\e[0m" > /dev/pts/0
	tree /data > /dev/pts/0
done
