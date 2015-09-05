#!/bin/sh

cat > /etc/proftpd/sql.conf <<EOH
<IfModule mod_sql.c>
SQLBackend mysql
SQLEngine on
SQLAuthenticate users userset
SQLAuthTypes Crypt
SQLConnectInfo ${DBNAME}@db ${DBUSER} ${DBPASS}
SQLDefaultUID $(id -u ftp)
SQLDefaultGID $(id -g ftp)
</IfModule>
EOH

exec proftpd --nodaemon
