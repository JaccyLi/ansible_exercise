#!/bin/bash
#
#*******************************************************************************
#Author:			steveli
#QQ:				1049103823
#Data:			    2019-10-06
#FileName:		    systemInfoForCentos678.sh
#URL:		        https://blog.csdn.net/YouOops
#Description:		Show some sys info.
#Copyright (C):	    2019 All rights reserved
#*******************************************************************************

R_SEED=$(( $RANDOM%7+31 )) 
COLOR_START="\e[1;${R_SEED}m"
COLOR_END="\e[0m"

echo -e "The hostname is:              ${COLOR_START}`hostname`. ${COLOR_END}"  > /dev/pts/0

echo -e "IPV4 addr is:                 \e[7;34m`ip a | sed -nr 's#.*(172\.20\.1\...).*#\1#p'`${COLOR_END}"  > /dev/pts/0

echo -e "The OS version is:            ${COLOR_START}`cat /etc/redhat-release | egrep -o '[0-9]+\.[0-9]+(\.[0-9]+)?'` ${COLOR_END}"  > /dev/pts/0

echo -e "The kernel version is:        ${COLOR_START}` uname -r `. ${COLOR_END}"  > /dev/pts/0

echo -e "The CPU model is:            ${COLOR_START}`lscpu | egrep Model\ name | tr -s " " | cut -d: -f2` ${COLOR_END}"  > /dev/pts/0


free -h |grep "Mem" | tr -s " " |cut -d" "  -f2,4 > /tmp/total_free 
TOTAL=`cat /tmp/total_free | cut -d" "  -f1`
FREE=`cat /tmp/total_free | cut -d" "  -f2`
 
echo -e "The total online memory is:   ${COLOR_START}$TOTAL(${FREE} free)${COLOR_END}"  > /dev/pts/0
 

echo -e  "Harddisk usage:             ${COLOR_START} \n`df -h | egrep -e /dev/sd -e /dev/nvme` ${COLOR_END}"  > /dev/pts/0

unset R_SEED COLOR_START COLOR_END
unset TOTAL FREE


