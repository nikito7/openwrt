#!/bin/sh

### checkip.sh ###

dev=eth0.2
file=/tmp/public.ip.tmp
host=http://checkip.dns.he.net/

###

if [ ! -e $file ]
then
echo "0.0.0.0" > $file
fi

old=$(cat $file)

new=$(wget -q $host -O - | grep "is \:" | awk -F ": "  '{ print $2 }' | awk -F \< '{ print $1 }')

if [ "${new}" ] && [ ! "${new}" == "${old}" ]
then
ip ad del ${old}/32 dev $dev
ip ro del ${old}/32 dev $dev
sleep 1
ip ad ad ${new}/32 dev $dev
ip ro ad ${new}/32 dev $dev
echo $new > $file
fi

### loop ###

sleep 55 && sh $0 $dev &

### checkip.sh ###
##
#

