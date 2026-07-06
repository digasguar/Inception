FROM debian:12

RUN apt-get update && apt-get install -y \
    php \
    php-mysql \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /VAR/WWW/html

RUN wget https://www.adminer.org/latest.php -O index.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080"] 
