FROM node:12-alpine

COPY . .

RUN apk add --no-cache --virtual .build-deps make gcc g++ python \
     && npm install --production --silent \
     && apk del .build-deps

EXPOSE 4002

CMD [ "node", "server.js" ]