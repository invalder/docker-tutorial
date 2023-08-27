#!/bin/sh

mysql_install_db

/etc/init.d/mariadb start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then

	echo "Database already exists"
else

mysql_secure_installation << _EOF_

Y
Y
nnakarac_root
nnakarac_root
Y
n
Y
Y
_EOF_

echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot


echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/start.sql

fi

/etc/init.d/mariadb stop

exec "$@"
