FROM node:alpine as builder
WORKDIR '/app'
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json .
RUN npm install
RUN npm install -g @angular/cli@latest
COPY . .
RUN ng build

FROM nginx
COPY --from = builder /app/build /usr/share/nginx/html

