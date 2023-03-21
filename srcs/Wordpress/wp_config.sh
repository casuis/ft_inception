#! /bin/bash

sleep 2

if [ -f /var/www/html/wp-config.php ]
then
	echo "===> wp-config.php already exist <==="
	sleep 2
else
echo "===> create wp-config.php <==== "
sleep 10

wp core config  --dbname=$DB_NAME \
                --dbuser=$WP_ADM \
                --dbpass=$WP_ADM_PSWD \
                --dbhost=$DB_HOST \
                --dbcharset=$WP_CHARSET \
                --dbprefix=wp_ \
                --dbcollate="utf8_general_ci" \
                --allow-root

echo "===>  Install Wordpress <==== "
sleep 5

wp core install --url="asimon.42.fr" \
                --title=INCEPTION \
                --admin_user=$WP_ADM\
                --admin_password=$WP_ADM_PSWD \
                --admin_email=$WP_ADM_EMAIL \
                --allow-root
echo "===> Create a user <==="
sleep 5

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PSWD --allow-root

fi
echo "===> WORDPRESS IS UP <==="
exec php-fpm7.3 -F -R
