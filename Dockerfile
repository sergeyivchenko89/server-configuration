FROM ubuntu:19.10

RUN apt-get update

RUN apt-get install -y wget gcc libpcre3-dev zip zlib1g-dev make pkg-config libxml2-dev sqlite3

ARG NGINX_VERSION="1.17.7"
ARG PHP_VERSION="7.4.1"

RUN wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
RUN tar -zxvf nginx-${NGINX_VERSION}.tar.gz
RUN cd nginx-${NGINX_VERSION} && ls -l && ./configure --sbin-path=/usr/local/sbin && make && make install && cd /

RUN wget https://www.php.net/distributions/php-${PHP_VERSION}.tar.gz
RUN tar -zxvf php-${PHP_VERSION}.tar.gz
RUN cd php-${PHP_VERSION} && ./configure --enable-fpm && make && make install && cd /

RUN rm -rf *.tar.gz nginx-${NGINX_VERSION} php-${PHP_VERSION}