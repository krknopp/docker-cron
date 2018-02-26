#!/usr/bin/env bash

# Prepend environemt variables to the crontab
env |cat - /etc/crontab > /tmp/crontab
mv /tmp/crontab /etc/crontab

# Pull cron jobs based on branch ENVVAR
git clone -b $GIT_BRANCH $GIT_REPO /opt/scripts

/usr/bin/supervisord
