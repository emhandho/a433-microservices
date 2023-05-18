#! /bin/bash

# perintah untuk build docker image dengan nama image item-app dan tag v1
docker build -t item-app:v1 . && \
	# perintah untuk menampilkan list docker image di local repository
	docker images && \
	# perintah untuk mengubah nama image agar sesuai dengan format GitHub Packages
	docker image tag item-app:v1 ghcr.io/emhandho/item-app:v1 && \
	# perintah untuk menyimpan environment variable untuk merahasiakan access_token GitHub Packages
	export CR_PAT="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" && \
	# perintah untuk login ke GitHub Pakcages menggunakan access_token yang sudah dideklarasi pada perintah sebelumnya
	echo $CR_PAT | docker login ghcr.io -u emhandho --password-stdin && \
	# perintah untuk mengunggah docker image dari lokal ke GitHub Packages
	docker push ghcr.io/emhandho/item-app:v1;
