#!/bin/sh

### wifi-check.sh ###

if [ ! "$1" ] || [ ! "$2" ]
then
echo usage: $0 ip1 ip2
ip1=10.1.0.1
ip2=10.1.0.2
else
ip1=$1
ip2=$2
fi

### ### ###

echo debug: step 1

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

### ### ###

echo debug: step 2

status=0
ping -c 2 $ip1 > /dev/null
status=$?
ping -c 2 $ip2 > /dev/null
status=$(($status + $?))

echo debug: status $status

if [ $status -gt 1 ]
then
echo debug: reboot now
sleep 1
reboot
fi

### loop ###

sleep 20 && /bin/sh $0 $1 $2 &

### wifi-check.sh ###
##
#
