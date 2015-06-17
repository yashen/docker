FROM ubuntu:15.10

MAINTAINER yashen@gmail.com

RUN apt-get update && \
		apt-get -y install openssh-server supervisor shadowsocks

ADD supervisord.conf /
ADD run.sh /
ADD init.sh /

ENV ROOT_PASSWORD root
ENV SHADOWSOCKS_PASSWORD password
ENV AUTHORIZED_KEYS ""

EXPOSE 22
EXPOSE 8388
CMD /run.sh

