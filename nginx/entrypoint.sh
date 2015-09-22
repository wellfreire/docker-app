#!/bin/bash
set -e

create_log_dir() {
  mkdir -p ${NGINX_LOG_DIR}
  chmod -R 0755 ${NGINX_LOG_DIR}
  chown -R ${NGINX_USER}:root ${NGINX_LOG_DIR}
}

create_tmp_dir() {
  mkdir -p ${NGINX_TEMP_DIR}
  chown -R root:root ${NGINX_TEMP_DIR}
}

set_upstream() {
  cat > /etc/nginx/conf.d/upstream.conf <<EOF
    upstream php-upstream { 
      server $NGINX_UPSTREAM_HOST:$NGINX_UPSTREAM_PORT; 
    }
EOF
}

create_log_dir
create_tmp_dir
set_upstream

# allow arguments to be passed to nginx
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$@"
  set --
elif [[ ${1} == nginx || ${1} == $(which nginx) ]]; then
  EXTRA_ARGS="${@:2}"
  set --
fi

# default behaviour is to launch nginx
if [[ -z ${1} ]]; then
  echo "Starting nginx..."
  exec $(which nginx) -c /etc/nginx/nginx.conf -g "daemon off;" ${EXTRA_ARGS}
else
  exec "$@"
fi