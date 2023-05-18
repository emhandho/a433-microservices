# Docker akan mengunduh/mengambil base image bernama node dari Docker Hub dengan tag 14-alpine.
FROM node:14-alpine

# membuat directory baru bernama app (seperti perintah mkdir app) di dalam container.
WORKDIR /app

# menyalin semua berkas yang ada di working directory pada lokal komputer ke container working directory, yaitu /app.
COPY . .

# environment variable yang menentukan aplikasi berjalan dalam production mode dan menggunakan container bernama item-db sebagai database host.
ENV NODE_ENV=production DB_HOST=item-db

# menjalankan perintah npm install --production --unsafe-perm untuk menginstall dependencies yang dibutuhkan aplikasi dan npm run build adalah perintah unruk menjalankan script build pada package.json file
RUN npm install --production --unsafe-perm && npm run build

# membuka/mengekspos port pada container karena aplikasi berjalan pada port 8080, disini saya juga mengekspos port di 8080
EXPOSE 8080

# perintah LABEL digunakan untuk menambah metadata pada Docker image, pada dockerfile kali ini label command dibawah
# digunakan untuk mengintegrasikan Docker image dengan Github Action Workflow, untuk mengoneksikan image/package ke target repository
LABEL org.opencontainers.image.source=https://github.com/emhandho/a433-microservices
LABEL org.opencontainers.image.description="Docker images for Dicoding Devops Expert Submission"

# perintah yang akan dieksekusi setelah container berjalan, yang mana dia adalah perintah untuk menjalankan aplikasi
CMD ["npm","start"]