FROM node:alpine as builder
WORKDIR '/app'
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json .
RUN npm install
COPY . .
RUN ng build

FROM nginx
EXPOSE 80
COPY --from = builder /app/build /usr/share/nginx/html

