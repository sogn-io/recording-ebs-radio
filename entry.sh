#!/bin/sh
# start cron
/usr/bin/crontab /schedule.txt
/usr/sbin/crond -f -l 8
