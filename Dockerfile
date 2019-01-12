FROM busybox
ENV HUGO_VERSION=0.53
RUN wget -O- https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar zx && ls && pwd
COPY . /src
RUN cd /src && /hugo

FROM nginx:alpine
LABEL maintainer="tomas@movetokube.com"
COPY --from=0 /src/public /usr/share/nginx/html
