# syntax=docker/dockerfile:1

# Base image
FROM alpine:3.18

LABEL maintainer="Inception Team <nnakarac@42.fr>"

# Install nginx
RUN apk update && apk add nginx; \
	mkdir -p /run/nginx; \
	echo "<h1>Hello World!</h1>" > /var/localhost/htdocs/index.html;

# Configurations
# Copy nginx config file
ADD $PWD/conf/default.conf /etc/nginx/conf.d/default.conf
