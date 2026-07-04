#!/bin/bash
set -e

echo "🚀 Starting MariaDB..."

# Crear runtime dir (IMPORTANTE)
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Inicializar DB si es primera vez
if [ ! -d /var/lib/mysql/mysql ]; then
    echo "📦 Initializing MariaDB..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

INIT_SQL="/init.sql"

cat > "$INIT_SQL" <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;
EOF

chmod 644 "$INIT_SQL"

exec /usr/sbin/mysqld \
    --user=mysql \
    --bind-address=0.0.0.0 \
    --socket=/run/mysqld/mysqld.sock \
    --datadir=/var/lib/mysql \
    --init-file="$INIT_SQL"
