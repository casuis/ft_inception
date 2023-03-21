#!/bin/bash

cat <<EOF > /etc/mysql/my.cnf
[mysqld]
user = root
port = 3306
datadir = /var/lib/mysql
bind-address = 0.0.0.0
skip-bind-address
skip-networking = false
pid-file = /run/mysqld/mysqld.pid
socket = /run/mysqld/mysqld.sock
EOF

if [ -d /var/lib/mysql/mysql ]; then 
	echo "===> $DB_NAME already exist !"
else
	echo "Create DATABASE $DB_NAME"
	mysql_install_db --datadir=/var/lib/mysql
	mysqld_safe &
	sleep 2

	mysql -u  root  --skip-password << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
CREATE DATABASE  IF NOT EXISTS $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER  IF NOT EXISTS '$WP_ADM'@'%' IDENTIFIED by '$WP_ADM_PSWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$WP_ADM'@'%';
FLUSH PRIVILEGES;
EOF
	mysqladmin -u root -p$DB_PASSWORD shutdown
	sleep 2
fi

exec mysqld -u root
