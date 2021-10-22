#!/bin/sh

### wifi-check.sh ###
#
# - using ipv6 multicast
# - for wifi bridges
#
###

status=0
status=$(ping -I br-lan ff02::1 -c 2 | grep DUP | wc -l)

echo debug: status $status

### if begin ###

if [ $status -lt 2 ]
then

#

echo debug: wifi cycle
wifi

sleep 10

#

status=0
status=$(ping -I br-lan ff02::1 -c 2 | grep DUP | wc -l)

if [ $status -lt 2 ]
then
echo debug: reboot now
sleep 1
reboot
fi

### end if ###

fi

### loop ###

sleep 20 && /bin/sh $0 &

### wifi-check.sh ###
##
#
