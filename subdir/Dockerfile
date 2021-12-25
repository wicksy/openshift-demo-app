FROM alpine:latest

USER root

RUN apk update && \
    apk add nginx && \
    chown -R nginx:www-data /var/lib/nginx

WORKDIR /etc/nginx
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/index.html /var/lib/nginx/html/index.html
COPY docker/50x.html /var/lib/nginx/html/50x.html

RUN chmod -R 755 /var/lib/nginx

EXPOSE 8080
CMD ["/usr/sbin/nginx"]
