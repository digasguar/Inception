FROM debian:12

RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    php-pear \
    php-dev \
    mariadb-client \
    curl \
    wget \
    bash

# WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN pecl install redis \ 
    && echo "extension=redis.so" > /etc/php/8.2/fpm/conf.d/redis.ini

# PHP config pool (IMPORTANTE versión correcta)
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 9000

ENTRYPOINT ["/setup.sh"]
