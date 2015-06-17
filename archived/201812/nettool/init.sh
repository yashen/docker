mkdir -p /var/run/sshd
echo root:${ROOT_PASSWORD} | chpasswd
sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config


mkdir -p /root/.ssh
touch /root/.ssh/authorized_keys

if [ "${AUTHORIZED_KEYS}" != "" ]; then
	echo ${AUTHORIZED_KEYS} | tr "," "\n" >> /root/.ssh/authorized_keys
fi


echo "{">/shadowsocks.json
echo \"password\":\"${SHADOWSOCKS_PASSWORD}\">>/shadowsocks.json

echo "}">>/shadowsocks.json

