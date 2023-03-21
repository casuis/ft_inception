FROM	debian:buster

RUN	apt-get -y update && apt-get -y install nginx \
	&& apt-get -y install net-tools

RUN	apt-get install -y vim

COPY	default /etc/nginx/sites-available/default

EXPOSE	80/tcp

CMD	["nginx", "-g", "daemon off;"]
