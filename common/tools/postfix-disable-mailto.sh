#!/usr/bin/env bash

#禁用crontab邮件发送功能
sed -i "s/MAILTO=.*/MAILTO=\"\"/g" /etc/crontab
cat /etc/crontab | grep MAILTO