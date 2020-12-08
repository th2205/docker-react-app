FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY . .

CMD [ "npm", "start" ]

FROM nginx

EXPOSE 80

COPY --from=builder /usr/src/app /usr/share/nginx/html