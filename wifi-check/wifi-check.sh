#!/bin/sh

### wifi-check.sh ###

ip1=$1
ip2=$2

if [ ! "$1" ]
then
echo usage: $0 ip1 ip2
fi

if [ ! "$2" ]
then
echo usage: $0 ip1 ip2
fi

status=0
ping -c 2 $ip1 > /dev/null
status=$?
ping -c 2 $ip2 > /dev/null
status=$(($status + $?))

echo debug: status $status

#echo debug: wifi cycle
#wifi
#sleep 10


#sleep 10

#echo debug: reboot now
#reboot




### loop ###

#sleep 30; /bin/sh $0 $dev &

### wifi-check.sh ###
##
#

