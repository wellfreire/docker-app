FROM debian:jessie

RUN apt-get update && apt-get install -y php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-apcu php5-gd php5-curl php5-intl php5-dev php-pear

COPY conf/*.ini /etc/php5/fpm/conf.d/
COPY conf/*.ini /etc/php5/cli/conf.d/

COPY conf/*.pool.conf /etc/php5/fpm/pool.d/

RUN usermod -u 1000 www-data

ADD run.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/run.sh

CMD ["run.sh"]
#CMD ["php5-fpm", "-F"]

EXPOSE 9000