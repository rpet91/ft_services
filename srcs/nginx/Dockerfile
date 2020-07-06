# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/22 13:41:51 by rpet          #+#    #+#                  #
#    Updated: 2020/07/06 09:19:20 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update && \
	apk add nginx && \
	apk add openssh

#RUN adduser -g 'Nginx www user' -h /home/www/ remco

RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
