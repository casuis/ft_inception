FROM	debian:buster

RUN	apt-get -y update\
	&& apt-get -y upgrade\
	&& apt-get -y install nginx \
	net-tools \
	systemd\
	openssl\
	vim


COPY	default /etc/nginx/sites-available/default

EXPOSE	443

RUN     mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/services.key -out /etc/nginx/ssl/services.pem \
        -subj "/C=FR/ST=Paris/L=Paris/O=42, Inc./OU=IT/CN=Inception"

CMD	["nginx", "-g", "daemon off;"]
