
FROM    debian:bullseye

COPY    ./tools/mariadb_script.sh  /

RUN     apt-get update -y && apt-get install mariadb-server  mariadb-client -y && chmod +x /mariadb_script.sh 

CMD ["/mariadb_script.sh"]