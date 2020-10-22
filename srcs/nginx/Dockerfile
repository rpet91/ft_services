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

#add user for ssh
RUN adduser -D remco -h / && \
	echo "remco:kaas" | chpasswd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/rem.key -out /etc/ssl/rem.crt -subj '/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=ft_services'

COPY nginx.conf /etc/nginx/nginx.conf
COPY sshd_config /etc/ssh/sshd_config
COPY setup.sh /
COPY index.html /www/

RUN chmod +x setup.sh

EXPOSE 22 80 443

#debugger command
#RUN apk add vim
#CMD tail -f /dev/null

#working command
CMD ./setup.sh
