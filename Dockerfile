FROM node:alpine as lok
WORKDIR '/app'
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=lok /app/build /usr/share/nginx/html
