#!/bin/sh

cat > /etc/proftpd/sql.conf <<EOH
<IfModule mod_sql.c>
SQLBackend mysql
SQLEngine on
SQLAuthenticate users userset
SQLAuthTypes Crypt
SQLConnectInfo ${DB_NAME}@${DB_HOST} ${DB_USER} ${DB_PASS}
SQLDefaultUID $(id -u ftp)
SQLDefaultGID $(id -g ftp)
</IfModule>
EOH

exec /usr/sbin/proftpd --nodaemon
