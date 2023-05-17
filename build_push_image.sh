#! /bin/bash

docker build -t item-app:v1 . \
	&& docker images \
	&& docker image item-app:v1 emhandho/item-app:v1 \
	&& EXPORT PASSWORD_DOCKER_HUB="!QwertyriD@2008." \
	&& echo $PASSWORD_DOCKER_HUB | docker login -u emhandho --password-stdin \
	&& docker push emhandho/item-app:v1;
