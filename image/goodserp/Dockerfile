FROM archlinux/base

MAINTAINER yashen@gmail.com

RUN mkdir /gooderp
WORKDIR /gooderp
RUN pacman -Sy --noconfirm gcc \
		python2-pip \
		libxml2 \
		python2-lxml  \
		nodejs-less \
		git \
		postgresql \
	&& git clone https://github.com/osbzr/base.git \
	&& git clone https://github.com/osbzr/gooderp_addons.git addons \
	&& sed -i "/^psycopg2/s/.*/psycopg2-binary/g" base/requirements.txt \
 	&& pip2 install -r base/requirements.txt \
	&& pip2 install simplejson
RUN mkdir config data log
VOLUME ["/gooderp/config","/gooderp/data","/gooderp/log"]
ENTRYPOINT ["python2","base/odoo-bin","-c","config/gooderp.conf"]
CMD ["--dev","xml"]
