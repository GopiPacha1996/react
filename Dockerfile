FROM node as build

WORKDIR '/app'

COPY package.json .

RUN npm  install

COPY . .

RUN npm run build

FROM nginx as prod
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html
