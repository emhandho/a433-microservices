FROM node:18-alpine as builder

WORKDIR /app
COPY . .
RUN npm install
ENV PORT=3000
EXPOSE 3000

LABEL org.opencontainers.image.source=https://github.com/emhandho/a433-microservices
LABEL org.opencontainers.image.description="Docker images for Dicoding Devops Expert Final Project Submission"

CMD ["npm", "start"]