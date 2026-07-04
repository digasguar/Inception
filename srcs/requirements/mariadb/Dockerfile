FROM debian:12

RUN apt update && apt install -y \
    mariadb-server \
    mariadb-client \
    bash

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

ENTRYPOINT ["/init.sh"]
