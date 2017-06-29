#!/bin/sh
pid="/var/run/nginx.pid";
fpm_pid="/var/run/php-fpm.pid";
nginx_conf="/etc/nginx/nginx-fabric.conf";

nginx -c "$nginx_conf" -g "pid $pid;" &
echo "Started NGINX"

php-fpm -y /etc/php5/fpm/php-fpm.conf -R &
echo "Started PHP-FPM"

echo launched processes;
sleep 10;

while [ -f "$pid" ] &&  [ -f "$fpm_pid" ];
do
	sleep 5;
done

echo "The start script has exited"
