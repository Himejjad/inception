FROM    debian:bullseye

RUN apt-get update -y 

RUN apt-get install php7.4-fpm php7.4-mysql -y

RUN apt-get install wget curl -y


COPY ./tools/wordpress_script.sh /

COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN  chmod +x /wordpress_script.sh

CMD ["/wordpress_script.sh"]