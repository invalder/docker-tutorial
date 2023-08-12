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



# 3 Back to 1 Following the SSL Configuration

# 4 In order to Add self Certificate to the Trusted Certificate Follow this
https://support.kerioconnect.gfi.com/hc/en-us/articles/360015200119-Adding-Trusted-Root-Certificates-to-the-Server

