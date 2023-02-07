FROM alpine:3.16

# copy files from host
COPY ./tools/entry.sh /tmp/run_nginx.sh
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# make directories
RUN mkdir -p /etc/nginx/ssl
RUN chmod 700 /etc/nginx/ssl
RUN mkdir -p /var/www/
# package install
RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    nginx \
    openssl
# SSL settings
RUN openssl req -x509 \
    -newkey rsa:2048 \
    -days 365 \
    -nodes \
    -subj ${CERTS_} \
    -keyout /etc/nginx/ssl/localhost.wchae.key \
    -out /etc/nginx/ssl/localhost.wchae.crt

RUN chmod +x /tmp/run_nginx.sh
ENTRYPOINT ["sh", "/tmp/run_nginx.sh"]

EXPOSE 443
