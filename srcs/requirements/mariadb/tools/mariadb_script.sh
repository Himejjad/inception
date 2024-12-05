#!/bin/bash

service mariadb start

sleep 2

mysql_secure_installation << EOF
$root_pass
n
n
Y
Y
Y
EOF

mariadb -e "CREATE DATABASE IF NOT EXISTS ${data_name} ;"
mariadb -e "CREATE USER IF NOT EXISTS '${data_user}'@'%' IDENTIFIED BY '${data_pwd}' ;"
mariadb -e "GRANT ALL PRIVILEGES ON ${data_name}.* TO '${data_user}'@'%' ;"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

old="bind-address            = 127.0.0.1"
new="bind-address            = 0.0.0.0"
sed -i "s/$old/$new/g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe