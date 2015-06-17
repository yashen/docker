build:
	docker build -f Dockerfile -t nettool ./
clean:
	docker ps -a | grep nettool | awk '{print }' | xargs docker rm
run:
	-docker rm -f nettool.0
	docker run -d -p 22:22 -p 8388:8388 -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" --name nettool.0 nettool

test:
	-docker rm -f nettool.test
	docker run -t -i -p 22:22 -p 8388:8388  -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`"  --name nettool.test nettool /bin/bash
