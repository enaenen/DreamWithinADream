FROM alpine:3.16.3

# need to mysql is connectable check
HEALTHCHECK --interval=1s --timeout=2s --start-period=7s --retries=30 \
	CMD wp core is-installed --allow-root --path=/var/www || exit 1

RUN apk update && apk upgrade \
	&& apk add bash \
	php8 \ 
	php8-fpm \ 
	php8-mysqli \
	php8-opcache \
	php8-gd \
	php8-zlib \
	php8-curl \
	php8-bcmath \
	php8-ctype \
	php8-iconv \
	php8-intl \
	php8-json \
	php8-mbstring \
	php8-mysqlnd \
	php8-openssl \
	php8-pdo \
	php8-pdo_mysql \
	php8-pdo_pgsql \
	php8-pdo_sqlite \
	php8-phar \
	php8-posix \
	php8-session \
	php8-soap \
	php8-xml \
	php8-zip \
	libmcrypt-dev \
	libltdl \
	&& apk add lighttpd curl \
	&& apk update

RUN adduser -u 82 -D -S -G www-data www-data
RUN chown -R www-data:www-data /var/www

COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./conf/wp-config.php /tmp/wp-config.php
COPY ./tools/entry.sh /tmp/run_wordpress.sh

RUN chmod +x /tmp/run_wordpress.sh

ENTRYPOINT [ "sh", "/tmp/run_wordpress.sh" ]

EXPOSE 9000