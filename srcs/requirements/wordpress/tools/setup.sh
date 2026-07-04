#!/bin/bash
set -e

mkdir -p /var/www/html
cd /var/www/html

echo "Waiting for MariaDB..."

until mysql \
    -h"$MYSQL_HOST" \
    -u"$MYSQL_USER" \
    -p"$MYSQL_PASSWORD" \
    --protocol=tcp \
    -e "SELECT 1;" >/dev/null 2>&1
do
    echo "MariaDB not ready..."
    sleep 3
done

echo "MariaDB is ready"

if [ ! -f wp-config.php ]; then

    echo "Downloading WordPress..."
    wp core download --allow-root

    echo "Creating config..."
    wp config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$MYSQL_HOST" \
        --allow-root

    echo "Installing WordPress..."
    wp core install \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    echo "Creating user..."
    wp user create \
        "$WP_USER" "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --allow-root

    chown -R www-data:www-data /var/www/html
fi

exec php-fpm8.2 -F
