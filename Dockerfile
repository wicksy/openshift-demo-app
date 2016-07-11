FROM docker.io/alpine

USER root

RUN apk update && \
    apk add nginx && \
    chown -R nginx:www-data /var/lib/nginx

WORKDIR /etc/nginx
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/index.html /usr/share/nginx/html/index.html
COPY docker/nginx/50x.html /usr/share/nginx/html/50x.html

EXPOSE 8080
CMD ["/usr/sbin/nginx"]
