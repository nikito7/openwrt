#!/bin/sh

### wifi-check.sh ###

iplist="10.1.0.1"
trigger=5

###

if [ $1 ]
then
status=$1
else
status=0
fi

excode=0

for ip in $iplist
do
sleep 5
ping -c 2 -W 1 $ip > /dev/null
excode=$?
status=$(($status + $excode))
echo status: $status ip: $ip exit: $excode
done

###

if [ $status -gt $trigger ]
then
echo reboot now
sleep 10
reboot
fi

### loop ###

sleep 33 && /bin/sh $0 $status &

### wifi-check.sh ###
##
#
