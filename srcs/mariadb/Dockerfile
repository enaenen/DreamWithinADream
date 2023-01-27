FROM alpine:3.16

RUN mkdir -p /run/mysqld && mkdir -p /var/lib/mysql

RUN apk add --no-cache \
            mariadb \
            mariadb-common \
            mariadb-server-utils \
            mariadb-client \
            && apk add openrc && apk update && apk upgrade


EXPOSE 3306
