#!/bin/bash
#
# *************************************************
# chkconfig: 2345 99 99
# description: notify email address on system boot.
# *************************************************
# Installing:
# 1) save as /etc/rc.d/init.d/notify
# 2) set the desired email address in "MAILADD" variable
# 3) chmod a+w /etc/rc.d/init.d/notify
# 4) /sbin/chkconfig --level 2345 notify on

PATH=/bin:/usr/sbin:/usr/bin
SERVER=`hostname`
case $1 in
    start)
        PUBLIC_IP=`curl --connect-timeout 5 -s icanhazip.com`
        PUBLIC_IPV6=`curl -6 --connect-timeout 5 -s icanhazip.com`
        MAILADD=your@email.example
        mail -s " Boot of $SERVER" $MAILADD <<EOF
From: $0
To: $MAILADD
$SERVER has booted up.
public ip $PUBLIC_IP $PUBLIC_IPV6
If this is news to you, please investigate.
`date -u`
EOF
    ;;
esac
exit 0
