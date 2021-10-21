#!/bin/sh

### wifi-check.sh ###

if [ ! "$1" ] || [ ! "$2" ]
then
echo usage: $0 ip1 ip2
ip1=127.0.0.1
ip2=127.0.0.1
else
ip1=$1
ip2=$2
fi

### step 1

status=0
ping -c 2 $ip1 > /dev/null
status=$?
ping -c 2 $ip2 > /dev/null
status=$(($status + $?))

echo debug: status $status

if [ $status -gt 1 ]
then
echo debug: wifi cycle
wifi
fi

sleep 10

### step 2

status=0
ping -c 2 $ip1 > /dev/null
status=$?
ping -c 2 $ip2 > /dev/null
status=$(($status + $?))

echo debug: status $status

if [ $status -gt 1 ]
then
echo debug: reboot now
reboot
fi

### loop ###

#sleep 30; /bin/sh $0 $dev &

### wifi-check.sh ###
##
#

