#/bin/bash

# find and delete any broken symlinks
find /etc/cron.d/ -xtype l -delete

# look for cron jobs and create symlinks
for i in $( ls -d /opt/scripts/crons/*); do
        #echo $i
        ln -s $i /etc/cron.d/$(basename $i)
done

