FROM		debian:buster

RUN		apt-get update \
		&& apt-get install -y \
		php7.3-cli \
		php7.3-common \
		php7.3-curl \
		php7.3-mbstring \
		php7.3-mysql \
		php-fpm curl \
		mariadb-client \
		curl 

EXPOSE		9000

COPY		./www.conf /etc/php/7.3/fpm/pool.d/

COPY		./wp_config.sh .

RUN		mkdir -p /var/run/php

WORKDIR		/var/www/html

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& php wp-cli.phar --info 

RUN     	chmod +x wp-cli.phar

RUN     	mv wp-cli.phar /usr/local/bin/wp && wp core download --locale=fr_FR --allow-root && chown -R www-data:www-data /var/www/* && chmod -R 755 /var/www/*


CMD		["sh", "/wp_config.sh"]

