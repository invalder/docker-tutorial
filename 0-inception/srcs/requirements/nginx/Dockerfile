# syntax=docker/dockerfile:1

# Base image
FROM alpine:3.18

LABEL maintainer="Inception Team <nnakarac@42.fr>"

# RUN
RUN apk update && apk add nginx openssl

# Create www user and group
RUN adduser -D -g 'www' www

# Create the directory for html files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# Copy the configuration file
COPY $PWD/conf/nginx.conf /etc/nginx/nginx.conf

# Copy the certificate and key files
COPY $PWD/conf/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY $PWD/conf/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

# Copy the index.html file
COPY $PWD/conf/index.html /www/index.html

WORKDIR /www

# Entrypoint
COPY $PWD/tools/entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint.sh"]

# Expose the ports
EXPOSE 80 443

STOPSIGNAL SIGQUIT

# RUN COMMAND
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]


