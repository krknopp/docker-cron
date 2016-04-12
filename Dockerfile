FROM ubuntu:latest

MAINTAINER Kerry Knopp <kerry@codekoalas.com>

# Install cron and supervisor
RUN apt-get update
RUN apt-get install cron -yqq
RUN apt-get install supervisor -yqq
RUN apt-get install git -yqq
RUN apt-get install curl -yqq

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Remove cron.* directories
RUN rm -Rf /etc/cron.daily
RUN rm -Rf /etc/cron.weekly
RUN rm -Rf /etc/cron.monthly
RUN rm -Rf /etc/cron.hourly

#Add crontab and logger script
COPY crontab /etc/crontab
COPY logger.sh /bin/logger.sh
COPY make_symlinks.sh /opt/make_symlinks.sh

# Add scripts folder
RUN mkdir /opt/scripts

# Add the run script
ADD run.sh /opt/run.sh
RUN chmod 700 /opt/run.sh

# Default script
CMD ["/opt/run.sh"]
