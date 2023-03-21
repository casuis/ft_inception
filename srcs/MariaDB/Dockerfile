FROM	debian:buster

RUN 	apt-get update -y && apt-get install -y mariadb-server mariadb-client\
	&& rm -rf /var/lib/mysql \
        && mkdir -p /var/lib/mysql /run/mysqld \
        && chown -R mysql:mysql /var/lib/mysql  /run/mysqld \
        && chmod 777 /var/run/mysqld 

EXPOSE	3306

COPY	./init.sh .

CMD	["bash", "./init.sh"]
