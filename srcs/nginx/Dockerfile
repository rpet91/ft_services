FROM alpine:latest

RUN apk update && \
	apk add nginx && \
	apk add openssh && \
	apk add openssl

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
	mkdir -p /run/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/rem.key -out /etc/ssl/rem.crt -subj '/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=ft_services'

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/

EXPOSE 80 443

#debugger command
#RUN apk add vim
#CMD tail -f /dev/null

#working command
CMD ["nginx", "-g", "daemon off;"]
