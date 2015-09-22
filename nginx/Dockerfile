FROM debian:jessie

ENV RTMP_VERSION=1.1.7 \
    NPS_VERSION=1.9.32.4 \
    NGINX_VERSION=1.8.0 \
    NGINX_USER=www-data \
    NGINX_SITECONF_DIR=/etc/nginx/sites-enabled \
    NGINX_LOG_DIR=/var/log/nginx \
    NGINX_TEMP_DIR=/var/lib/nginx \
    NGINX_SETUP_DIR=/var/cache/nginx \
    NGINX_UPSTREAM_HOST=php \
    NGINX_UPSTREAM_PORT=9000

RUN apt-get update \
 && apt-get install -y vim perl libssl1.0.0 libxslt1.1 libgd3 libxpm4 libgeoip1 libav-tools \
 && rm -rf /var/lib/apt/lists/*

COPY install.sh ${NGINX_SETUP_DIR}/install.sh
RUN bash ${NGINX_SETUP_DIR}/install.sh

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

COPY ./nginx.initd /etc/init.d/nginx
RUN chmod 755 /etc/init.d/nginx

COPY ./sites-enabled /etc/nginx/sites-enabled

EXPOSE 80/tcp 443/tcp 1935/tcp

VOLUME ["${NGINX_SITECONF_DIR}"]

ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/sbin/nginx"]