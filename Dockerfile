# Docker akan mengunduh/mengambil base image bernama node dari Docker Hub dengan tag 14-alpine.
FROM node:14-alpine

# membuat directory baru bernama app (seperti perintah mkdir app) di dalam container.
WORKDIR /app
# menyalin semua berkas yang ada di working directory pada lokal komputer ke container working directory, yaitu /app.
COPY . .
# environment variable yang menentukan aplikasi berjalan dalam production mode dan menggunakan container bernama item-db sebagai database host.
ENV NODE_ENV=production DB_HOST=item-db
RUN npm install --production --unsafe-perm && npm run build
EXPOSE 8080

CMD ["npm","start"]