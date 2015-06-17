.PHONY:
dojolibs:= dojo dijit dojox util
dojoprojects:=$(dojolibs) demos docs


lib1.9:
	@for item in $(dojolibs);do cd $$item;git checkout 1.9.7;cd ..; done 

libhead:
	@for item in $(dojolibs);do cd $$item;git checkout master;cd ..;done


updatelibs:
	@for item in $(dojoprojects);do \
		cd $$item;\
		echo updating $$item;\
		git checkout master;\
		git pull;\
		cd ..;\
	done

run_httpserver:
	@echo "webserver:http://localhost:8000"
	python2 -m SimpleHTTPServer



rstwiki_build:
	for item in $(dojolibs);do  \
		rm rstwiki/_static/$$item -rf;\
		ln -s /dojo/$$item rstwiki/_static/$$item;\
	done
	rstwiki/_static/util/buildscripts/build.sh profile=/dojo/rstwiki/_static/docs.profile.js

rstwiki/wiki.conf:
	echo "[/_static]" > $@
	echo "tools.staticdir.on = True" >> $@
	echo "tools.staticdir.dir = \"${PWD}/rstwiki/_static/release/trunk\"" >> $@
	echo "[wiki]">> $@
	echo "root = \"../docs\"">> $@
	echo "editable = False" >> $@


run_wiki:rstwiki/wiki.conf
	@echo "dojo doc:http://localhost:4200"
	mkdir /tmp/rstwiki_sessions -p;\
	cd rstwiki;\
	python2.7 wiki.py


Image_Base:
	docker build -f Dockerfile_Base -t dojo_doc_base ./

Image_Code:
	docker build -f Dockerfile_Code -t dojo_doc_code ./

Image_Wiki:
	docker build -f Dockerfile_Wiki -t dojo_doc_wiki ./
Image_Dapi:
	docker build -f Dockerfile_Dapi -t dojo_doc_dapi ./
Image_Service:
	docker build -f Dockerfile_Service -t dojo_doc_service ./
Image_Attach:
	docker build -f Dockerfile_Attach -t dojo_doc_attach ./


doc1.9:lib1.9
	cd dapi_config/$@;../../js-doc-parse/parse.sh config=config.js
	mkdir dapi/public/data/1.9 -p
	cp dapi_config/$@/*.json dapi/public/data/1.9/

doc1.10:libhead
	cd dapi_config/$@;../../js-doc-parse/parse.sh config=config.js
	mkdir dapi/public/data/1.10 -p
	cp dapi_config/$@/*.json dapi/public/data/1.10
dapilib:lib1.9
	rsync --exclude='.git' dojo dapi/public/ -r
	rsync --exclude='.git' dijit dapi/public/ -r

run_dapi:
	cd dapi;node app.js

Dockerfile:Dockerfile_Base Dockerfile_Code Dockerfile_Wiki Dockerfile_Dapi Dockerfile_Service
	cat Dockerfile_Base > Dockerfile
	cat Dockerfile_Code >> Dockerfile
	cat Dockerfile_Wiki >> Dockerfile
	cat Dockerfile_Dapi >> Dockerfile
	cat Dockerfile_Service >> Dockerfile
	sed  -i "/^FROM dojo_doc/d" Dockerfile
