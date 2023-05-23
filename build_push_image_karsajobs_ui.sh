#! /bin/bash

# perintah untuk build docker image dengan nama image item-app dan tag v1
docker build -t ghcr.io/emhandho/karsajobs-ui:latest . && \
	# perintah untuk menyimpan environment variable untuk merahasiakan access_token GitHub Packages
	export CR_PAT="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" && \
	# perintah untuk login ke GitHub Pakcages menggunakan access_token yang sudah dideklarasi pada perintah sebelumnya
	echo $CR_PAT | docker login ghcr.io -u emhandho --password-stdin && \
	# perintah untuk mengunggah docker image dari lokal ke GitHub Packages
	docker push ghcr.io/emhandho/karsajobs-ui:latest;