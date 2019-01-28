FROM node:8.10.0-alpine

WORKDIR /home/app
COPY . /home/app

RUN npm install --quiet

EXPOSE 3000

CMD tail -f /etc/hosts