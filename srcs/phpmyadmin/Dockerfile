FROM alpine:latest

RUN apk update && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip && \
	apk add nginx

RUN mkdir -p /www && \
	mkdir -p /www/phpmyadmin && \
	mkdir -p /www/tmp && \
	mkdir -p /www/phpmyadmin/tmp && \
	mkdir -p /run/nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar -zxvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www && \
	tar -zxvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www/phpmyadmin && \
	rm phpMyAdmin-5.0.1-english.tar.gz

RUN adduser -D -g 'www' www && \
	chown -R www:www /www && \
	chown -R www:www /www/tmp && \
	chown -R www:www /www/phpmyadmin/tmp

COPY config.inc.php /www/
COPY config.inc.php /www/phpmyadmin/
COPY nginx.conf /etc/nginx/nginx.conf
COPY setup.sh /
RUN chmod +x /setup.sh

EXPOSE 5000

#debugger command
#RUN apk add vim
#CMD tail -f /dev/null

CMD ./setup.sh
