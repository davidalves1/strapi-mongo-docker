
FROM node:12.18.2-alpine3.12

RUN apk add --no-cache yarn && mkdir /home/app

WORKDIR /home/app

COPY ./app/package.json ./
COPY ./app/yarn.lock ./

RUN yarn install

COPY ./app ./

# ENV NODE_ENV production

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]