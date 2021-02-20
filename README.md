# wifi-check
Check wifi status and reboot. Opewrt.

# usage
cron or /etc/rc.local

```sleep 30 && /root/wifi-check.sh wlan0 &```

# log

```js
# ./wifi-check.sh
usage: ./wifi-check.sh wlan0
usage: ./wifi-check.sh lo // test
usage: ./wifi-check.sh // show all
debug: A 290 893 0 1442 2044
debug: B 291 905 0 1459 2072
debug: OK
# ./wifi-check.sh error
ifconfig: error: error fetching interface information: Device not found
# ./wifi-check.sh wlan0
debug: A 1525
debug: B 1546
debug: OK
# ./wifi-check.sh lo
debug: A 0
debug: B 0
debug: wifi cycle
debug: C 0
debug: D 0
debug: reboot now
#
```
