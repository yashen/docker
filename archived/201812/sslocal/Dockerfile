FROM ubuntu:15.10

MAINTAINER yashen@gmail.com

RUN apt-get update && \
	apt-get -y install shadowsocks 

ADD run.sh /
ADD init.sh /

ENV SERVER localhost
ENV SERVER_PORT 8388
ENV PASSWORD password
ENV TIMEOUT 600
ENV METHOD aes-256-cfb

EXPOSE 1080

CMD /run.sh
