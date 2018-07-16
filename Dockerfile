FROM resin/raspberry-pi-alpine:3.7

MAINTAINER g@phpgao.com

COPY aria-ng-0.4.0.zip aria-ng-0.4.0.zip
COPY aria2-1.34.0-r0.apk aria2-1.34.0-r0.apk

RUN apk update && \
        apk add aria2-1.34.0-r0.apk nginx && \
        rm -r /var/cache/ && \
        mkdir /etc/aria2 /mnt/media && \
        mkdir /var/lib/html && \
        unzip -q aria-ng-0.4.0.zip -d /var/lib/html

COPY done.sh done.sh
COPY aria2.conf /etc/aria2/aria2.conf
COPY nginx.conf /etc/nginx/
ADD conf.d /etc/nginx/conf.d

VOLUME /mnt/media

EXPOSE 80 443 6800
COPY docker-entrypoint.sh /docker-entrypoint.sh
#CMD ["sh","-c","/usr/bin/aria2c --conf-path=/etc/aria2/aria2.conf -D && /usr/sbin/nginx"]
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
