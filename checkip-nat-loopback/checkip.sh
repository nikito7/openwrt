#!/bin/sh

### checkip.sh ###

dev=wan
file=/tmp/public.ip.tmp
host=http://checkip.dns.he.net/

echo debug: start

###

if [ ! -e $file ]
then
echo "0.0.0.0" > $file
fi

old=$(cat $file)

echo debug: get ip

new=$(wget -q $host -O - | grep "is \:" | awk -F ": "  '{ print $2 }' | awk -F \< '{ print $1 }')

echo debug: result $new

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

echo debug: loop

sleep 55 && sh $0 $dev &

### checkip.sh ###
##
#

