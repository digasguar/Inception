FROM debian:12

RUN apt update && apt install -y vsftpd

COPY tools/start.sh /start.sh
COPY tools/vsftpd.conf /etc/vsftpd.conf

RUN chmod +x /start.sh

EXPOSE 21 21100-21110

CMD ["/start.sh"]
