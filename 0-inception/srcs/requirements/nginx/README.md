# 1 Follow This Guideline
https://codingwithmanny.medium.com/configure-self-signed-ssl-for-nginx-docker-from-a-scratch-7c2bcd5478c6

# Start Alpine Base
```
docker run -it -p 80:80 -p 443:443 --name nginx-alpine-ssl alpine /bin/sh;
```

# Install Nginx
```
apk add nginx;
```

# Run Nginx
```
nginx;
```

# Testing Running Nginx with curl
```
apk add curl;
curl localhost;
```

# 2 However Some configuration might not work so follow this as well
https://wiki.alpinelinux.org/wiki/Nginx

# Creating new user and group 'www' for nginx
```
adduser -D -g 'www' www;
```

# Create a directory for the html files and change the ownership to the 'www' user and group
```
mkdir /www;
chown -R www:www /var/lib/nginx;
chown -R www:www /www;
```

# Backup the default configuration file
```
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig;
```

# Create a new configuration file
```
vi /etc/nginx/nginx.conf;
```

# Add the following to the configuration file
```
user                            www;
worker_processes                auto; # it will be determinate automatically by the number of core

error_log                       /var/log/nginx/error.log warn;
#pid                             /var/run/nginx/nginx.pid; # it permit you to use /etc/init.d/nginx reload|restart|stop|start

events {
    worker_connections          1024;
}

http {
    include                     /etc/nginx/mime.types;
    default_type                application/octet-stream;
    sendfile                    on;
    access_log                  /var/log/nginx/access.log;
    keepalive_timeout           3000;
    server {
        listen                  80;
        root                    /www;
        index                   index.html index.htm;
        server_name             localhost;
        client_max_body_size    32m;
        error_page              500 502 503 504  /50x.html;
        location = /50x.html {
              root              /var/lib/nginx/html;
        }
    }
}

```

# Test the configuration file
# create the simple page
```
vi /www/index.html
```

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>HTML5</title>
</head>
<body>
    Server is online
</body>
</html>
```

# restart nginx
```
nginx -s reload;
```

```
curl localhost;
```


# 3 Back to 1 Following the SSL Configuration

# Install Open SSL
```
apk add openssl;
```

# 4 In order to Add self Certificate to the Trusted Certificate Follow this
https://support.kerioconnect.gfi.com/hc/en-us/articles/360015200119-Adding-Trusted-Root-Certificates-to-the-Server

