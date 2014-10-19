FROM danhixon/backup-base
RUN mkdir -p /root/Backup/models
ADD config.rb /root/Backup/config.rb
ADD models/backups.rb /root/Backup/models/backups.rb

RUN mkdir -p /root/Whenever/config
ADD schedule.rb /root/Whenever/config/schedule.rb
RUN cd /root/Whenever ; whenever --write-crontab

# Set correct environment variables.
ENV HOME /root

# Add MongoDB Repository:
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

# Add postgres 9.3 Repository:
RUN curl -s -O https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key add ACCC4CF8.asc
RUN	sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list.d/postgresql.list'


RUN apt-get -qq update
RUN apt-get -yqq install mongodb-org-tools postgresql-client-9.3 vim gnupg && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install backup whenever

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]
