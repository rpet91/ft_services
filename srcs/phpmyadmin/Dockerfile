FROM alpine:latest

RUN apk update && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip && \
	apk add nginx

RUN mkdir -p /www

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar -zxvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www && \
	rm phpMyAdmin-5.0.1-english.tar.gz

RUN adduser -D -g 'www' www

COPY config.inc.php /www/
COPY nginx.conf /etc/nginx/nginx.conf
COPY setup.sh /
RUN chmod +x /setup.sh

EXPOSE 5000

#RUN apk add vim
#CMD tail -f /dev/null

CMD ./setup.sh
