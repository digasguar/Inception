FROM debian:12

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY conf/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
