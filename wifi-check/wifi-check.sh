#!/bin/sh

### wifi-check.sh ###

iplist="10.1.0.1 10.1.0.5"
trigger=1

###

status=0
excode=0

for ip in $iplist
do
sleep 10
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
