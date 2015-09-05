FROM ubuntu:14.04
MAINTAINER "Alex Leigh"

RUN apt-get -y update
RUN echo 'proftpd-basic shared/proftpd/inetd_or_standalone select standalone' | debconf-set-selections
RUN apt-get -y install proftpd-basic proftpd-mod-mysql

COPY proftpd.conf /etc/proftpd/proftpd.conf
COPY modules.conf /etc/proftpd/modules.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 21

ENTRYPOINT ["/docker-entrypoint.sh"]
