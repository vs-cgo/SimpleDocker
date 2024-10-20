FROM nginx:latest

USER root
COPY ./server/fcgi_hello.c ./fcgi_hello.c
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./script.sh ./script.sh
RUN apt-get -y update \ 
    && apt-get install -y gcc \
    && apt-get install -y libfcgi-dev \
    && apt-get install -y spawn-fcgi \
    && apt-get install -y usermode \
    && gcc fcgi_hello.c -lfcgi \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x ./script.sh \
    && useradd -r -U -u 999 -s /bin/bash nw \
    && usermod -a -G nw nginx \
    && touch /var/run/nginx.pid /var/cache/nginx/client_temp \
    && chown -R nw:nw /var/run/nginx.pid /var/cache/nginx/ \
    && chmod u-s /bin/su \
    && chmod g-s /usr/bin/wall \
    && chmod g-s /usr/sbin/unix_chkpwd \
    && chmod u-s /usr/sbin/userhelper \
    && chmod u-s /usr/lib/dbus-1.0/dbus-daemon-launch-helper \
    && chmod u-s /usr/bin/mount \
    && chmod g-s /usr/bin/expiry \
    && chmod u-s /usr/bin/passwd \
    && chmod u-s /usr/bin/newgrp \
    && chmod u-s /usr/bin/chfn \
    && chmod u-s /usr/bin/chsh \
    && chmod g-s /usr/bin/chage \
    && chmod u-s /usr/bin/gpasswd \
    && chmod u-s /usr/bin/umount  

HEALTHCHECK --interval=5m --timeout=3s \
    CMD curl -f http://localhost/ || exit 1

USER nw
CMD ["/bin/bash", "./script.sh"]
