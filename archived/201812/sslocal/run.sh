if [  -f /init.sh ]; then
	/init.sh
	mv /init.sh /init.sh.bak
fi

/usr/bin/sslocal -c /shadowsocks.json -b 0.0.0.0

