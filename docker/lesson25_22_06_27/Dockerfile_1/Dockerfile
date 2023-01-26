# Dockerfile 1
FROM alpine:latest
RUN apk add nginx
RUN mkdir -p /opt/www/
COPY index.html /opt/www/
COPY mysite.conf /etc/nginx/http.d/
EXPOSE 80/tcp
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
