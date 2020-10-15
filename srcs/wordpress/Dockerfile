FROM alpine:latest

RUN apk update && \
	apk add nginx && \
	apk add mysql-client && \
	apk add jq && \
	apk add curl && \
	apk add php7 php7-fpm php7-opcache php7-common php7-curl php7-json php7-mbstring php7-xml php7-zip php7-gd php7-soap php7-tokenizer php7-dom php7-exif php7-fileinfo php7-mysqli php7-zlib php7-phar

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	mkdir /var/run/nginx && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

COPY nginx.conf /etc/nginx/nginx.conf
COPY setup.sh /
RUN chmod +x /setup.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	chmod +x /www && \
	mv wp-cli.phar /usr/local/bin/wp

WORKDIR /www/
RUN wp core download
WORKDIR /

EXPOSE 5050

#debugger command
#RUN apk add vim
#CMD tail -f /dev/null

CMD ./setup.sh
