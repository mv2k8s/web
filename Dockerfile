FROM nginx:alpine

LABEL maintainer="tomas@movetokube.com"

COPY public /usr/share/nginx/html
