#!/bin/bash

set -e

#archivo interno de vsftpd para seguridad
mkdir -p /var/run/vsftpd/empty

# crear usuario desde .env
adduser --disabled-password --gecos "" "$FTP_USER"
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

# dar permisos al volumen wordpress
chown -R $FTP_USER:$FTP_USER /var/www/html

# arrancar ftp server
/usr/sbin/vsftpd /etc/vsftpd.conf
