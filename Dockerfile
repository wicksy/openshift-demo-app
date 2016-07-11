FROM wicksy/alpine

USER root

RUN apk update && \
    apk add nginx && \
    chown -R nginx:www-data /var/lib/nginx

WORKDIR /etc/nginx
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/index.html /usr/share/nginx/html/index.html
COPY docker/nginx/50x.html /usr/share/nginx/html/50x.html

RUN chown -R nginx:root /var/log/nginx

USER nginx

EXPOSE 8080
CMD ["/usr/sbin/nginx"]
