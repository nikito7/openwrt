#!/bin/sh

### wifi-check.sh ###

iplist="10.1.0.1 10.1.0.1"
trigger1=1

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

if [ $1 ]
then
trigger2=$1
else
trigger2=0
fi

if [ $status -gt $trigger1 ]
then
##
if [ $trigger -gt 0 ]
then
echo reboot now
sleep 1
reboot
else
echo restart wifi
sleep 1
wifi
fi
##
fi

### loop ###

sleep 30 && /bin/sh $0 $status&

### wifi-check.sh ###
##
#
