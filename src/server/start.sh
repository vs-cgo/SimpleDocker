#!/bin/bash

DIR=$(cd "$(dirname $0)" && pwd)

sudo apt update && sudo apt install -y gcc \
&& sudo apt install -y spawn-fcgi \
&& sudo apt install -y libfcgi-dev \
&& sudo apt install -y nginx \
&& sudo sudo ufw app list \
&& sudo ufw allow 'Nginx HTTP' \
&& sudo apt install -y curl \
&& sed -i 's/^user .*/user '$USER';/' "$DIR"/nginx.conf \
&& gcc "$DIR"/fcgi_hello.c -lfcgi -o "$DIR"/a.out \
&& sudo cp "$DIR"/nginx.conf /etc/nginx/nginx.conf \
&& sudo spawn-fcgi -a 127.0.0.1 -p 8080 -f "$DIR"/a.out 
sudo systemctl restart nginx 
curl http:/localhost:81
