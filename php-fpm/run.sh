#!/bin/bash

modules_dir='/etc/php5/modules'
mkdir -p $modules_dir

# installs and configures Xdebug
pecl install xdebug

xdebug_path=$(find /usr/lib/php5/ -name xdebug.so)

sed -i "s|zend_extension|zend_extension=\"$xdebug_path\"|g" /etc/php5/cli/conf.d/20-xdebug.ini
sed -i -e "1d" /etc/php5/cli/conf.d/20-xdebug.ini
sed -i "s|zend_extension|zend_extension=\"$xdebug_path\"|g" /etc/php5/fpm/conf.d/20-xdebug.ini
sed -i -e "1d" /etc/php5/fpm/conf.d/20-xdebug.ini

# starts PHP-FPM
php5-fpm -F