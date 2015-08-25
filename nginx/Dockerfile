FROM debian:jessie

RUN apt-get update && apt-get install -y nginx

ADD nginx.conf /etc/nginx/
ADD APP_NAME.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/APP_NAME.conf /etc/nginx/sites-enabled/APP_NAME
RUN rm /etc/nginx/sites-enabled/default

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443