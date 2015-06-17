echo "{">/shadowsocks.json
echo \"server\":\"${SERVER}\",>>/shadowsocks.json
echo \"server_port\":${SERVER_PORT},>>/shadowsocks.json
echo \"password\":\"${PASSWORD}\",>>/shadowsocks.json
echo \"timeout\":${TIMEOUT},>>/shadowsocks.json
echo \"method\":\"${METHOD}\">>/shadowsocks.json
echo "}">>/shadowsocks.json
