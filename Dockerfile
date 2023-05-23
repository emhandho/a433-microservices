FROM node:14.21-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8000
LABEL org.opencontainers.image.source=https://github.com/emhandho/a433-microservices
LABEL org.opencontainers.image.description="Docker images for Dicoding Devops Expert Submission"
CMD [ "npm", "run", "serve" ]
