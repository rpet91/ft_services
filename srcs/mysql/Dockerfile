FROM alpine:latest

RUN apk update && \
	apk add mysql && \
	apk add mysql-client && \
	apk add --no-cache

RUN addgroup mysql mysql

COPY my.cnf /etc/
COPY setup.sh /
RUN chmod +x /setup.sh

#VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

#debugger command
#RUN apk add vim
#CMD tail -f /dev/null

ENTRYPOINT ./setup.sh
