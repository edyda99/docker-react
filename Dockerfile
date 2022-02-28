# Here we are implementing nginx see video 88 for reference
FROM node:16-alpine as builder 

WORKDIR /usr/app

COPY package.json .
COPY node_modules .
RUN npm install
# COPY . .
RUN npm run build

FROM nginx
COPY --from=builder usr/app/build /usr/share/nginx