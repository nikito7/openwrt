#!/bin/sh

### wifi-check.sh ###

iplist="10.1.0.1 10.1.0.7 10.1.0.99 10.1.0.98"

###

status=0

for ip in $iplist
do
ping -c 2 $ip > /dev/null
status=$(($status + $?))
done

echo debug: status $status

if [ $status -gt 1 ]
then
echo debug: reboot now
sleep 1
#reboot
fi

### loop ###

#sleep 30 && /bin/sh $0 $status &

### wifi-check.sh ###
##
#
