build:
	docker build -f Dockerfile -t sslocal ./
run:
	-docker rm -f sslocal.0
	docker run -d --name sslocal.0 sslocal

test:
	-docker rm -f sslocal.test
	docker run -t -i -e SERVER=SERVER -p 1080:1080 --name sslocal.test sslocal /bin/bash
