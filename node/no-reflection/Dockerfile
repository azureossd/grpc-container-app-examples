FROM node:18.4.0-alpine3.16

WORKDIR /app
COPY package.json /app
RUN yarn install 

COPY . /app

EXPOSE 50051 

CMD [ "node", "server.js" ]