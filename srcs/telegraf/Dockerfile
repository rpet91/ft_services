FROM alpine:latest

RUN apk update

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz && \
	tar -zxvf telegraf-1.15.3_linux_amd64.tar.gz && \
	rm telegraf-15.3_linux_amd64.tar.gz

#8092 UDP #8094 TCP
EXPOSE 8125

#debugger command
RUN apk add vim
CMD tail -f /dev/null
