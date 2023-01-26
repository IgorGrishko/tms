# Dockerfile 2
FROM debian:11
RUN apt -y update
RUN apt -y install nginx
RUN mkdir -p /opt/www/
COPY index.html /opt/www/
COPY mysite.conf /etc/nginx/conf.d/
EXPOSE 80/tcp
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
