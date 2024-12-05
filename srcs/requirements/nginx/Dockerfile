FROM    debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && apt-get clean

COPY nginx.conf /etc/nginx/conf.d/nginx.conf

COPY ./tools/nginx_script.sh /

RUN  chmod +x /nginx_script.sh

CMD ["/nginx_script.sh"]

