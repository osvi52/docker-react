FROM node:18-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install -g npm@8.16.0

COPY . .

RUN npm run build

##

FROM nginx
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html