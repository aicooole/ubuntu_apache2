FROM ubuntu:14.04
MAINTAINER miyatake <aicooole@gmail.com>

# dist upgrade
RUN apt-get update
RUN apt-get upgrade -y

# apache install
RUN apt-get install -y apache2

# add default setting files
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80

ENV APACHE_RUN_USER	www-data
ENV APACHE_RUN_GROUP	www-data
ENV APACHE_PID_FILE	/var/run/apache2.pid
ENV APACHE_RUN_DIR	/var/run/apache2
ENV APACHE_LOCK_DIR	/var/lock/apache2
ENV APACHE_LOG_DIR	/var/log/apache2
ENV LANG		C

ADD run /usr/local/bin/
RUN chmod a+x /usr/local/bin/run
CMD ["/usr/local/bin/run"]
