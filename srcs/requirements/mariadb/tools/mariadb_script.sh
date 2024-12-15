#!/bin/bash

service mariadb start

sleep 2

mysql_secure_installation << EOF
$db_pass
n
n
Y
Y
Y
EOF

mariadb -e "CREATE DATABASE IF NOT EXISTS ${db_name} ;"
mariadb -e "CREATE USER IF NOT EXISTS '${db_user}'@'%' IDENTIFIED BY '${db_pwd}' ;"
mariadb -e "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'%' ;"
mariadb -e "FLUSH PRIVILEGES;"

old="bind-address            = 127.0.0.1"
new="bind-address            = 0.0.0.0"
sed -i "s/$old/$new/g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb stop

mysqld_safe