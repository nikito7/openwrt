#!/bin/sh

### wifi-check.sh ###

gateway=10.1.0.1
dev=$1

if [ ! "$1" ]
then
echo usage: $0 wlan0
echo usage: $0 lo // test
echo usage: $0 // show all
fi

ping -c 3 -w 5 $gateway > /dev/null

function getbytes()
{
ifconfig $dev | grep "TX packets" | awk '{ print $2}' | awk -F : '{ print $2 }'
}

A=$(getbytes)
echo debug: A $A
sleep 10
B=$(getbytes)
echo debug: B $B

if [ "$A" == "$B" ]
then
echo debug: wifi cycle
wifi
sleep 10
C=$(getbytes)
echo debug: C $C
sleep 10
D=$(getbytes)
echo debug: D $D
if [ "$C" == "$D" ]
then
echo debug: reboot now
#reboot # remove comment ############
fi
else
echo debug: OK
fi

### loop ###

#sleep 30; /bin/sh $0 $dev &

### wifi-check.sh ###
##
#

