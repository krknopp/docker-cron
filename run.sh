#!/usr/bin/env bash

# Prepend environemt variables to the crontab
env |cat - /etc/crontab > /tmp/crontab
mv /tmp/crontab /etc/crontab

# Add internal address for gitlab server based on ENVVAR
echo $GITLAB >> /etc/hosts

# Pull cron jobs based on branch ENVVAR
git clone -b $GITBRANCH $GITURL /opt/scripts

/usr/bin/supervisord
