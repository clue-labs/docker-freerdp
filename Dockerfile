FROM ubuntu:12.04
MAINTAINER Christian Lück <christian@lueck.tv>

ADD http://download.opensuse.org/repositories/home:/felfert/Debian_6.0/Release.key /Release.key
RUN cat /Release.key | apt-key add - && \
    echo "deb http://download.opensuse.org/repositories/home:/felfert/xUbuntu_12.04 ./" >> /etc/apt/sources.list.d/freerdp.list && \
    apt-get update && \
    apt-get install -y wsgate
    
RUN rm /etc/wsgate.ini && \
    echo "[global]" >> /etc/wsgate.ini && \
    echo "port = 80" >> /etc/wsgate.ini && \
    echo "debug = true" >> /etc/wsgate.ini && \
    echo "[http]" >> /etc/wsgate.ini && \
    echo "documentroot = /usr/share/wsgate" >> /etc/wsgate.ini

EXPOSE 80

CMD wsgate --foreground

