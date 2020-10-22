FROM alpine:latest

RUN apk update && \
	apk add libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.2.1.linux-amd64.tar.gz && \
	tar -zxvf grafana-7.2.1.linux-amd64.tar.gz && \
	rm grafana-7.2.1.linux-amd64.tar.gz

COPY grafana.db /grafana-7.2.1/data/

EXPOSE 3000

#debugger command
#RUN apk add vim
#CMD tail -f /dev/null

CMD cd grafana-7.2.1 && ./bin/grafana-server
