FROM alpine:3.16.3

COPY ./conf/my.cnf /etc/my.cnf
COPY ./tools/entry.sh /tmp/run_mariadb.sh

RUN apk add --no-cache \
	mariadb \
	mariadb-common \
	mariadb-server-utils \
	mariadb-client \
	&& apk add openrc && apk update && apk upgrade \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& chmod 755 /var/lib/mysql

RUN mkdir -p /run/mysqld && mkdir -p /var/lib/mysql
RUN chmod +x /tmp/run_mariadb.sh


ENTRYPOINT ["sh", "/tmp/run_mariadb.sh"]

EXPOSE 3306
