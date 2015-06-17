if [  -f /init.sh ]; then
	/init.sh
	mv /init.sh /init.sh.bak
fi

/usr/bin/supervisord -c /supervisord.conf
