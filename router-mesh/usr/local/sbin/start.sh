#!/bin/sh
pid="/var/run/nginx.pid";
nginx_conf="/etc/nginx/nginx.conf";

nginx -c "$nginx_conf" -g "pid $pid;" &
echo "Started NGINX"

echo launched processes;
sleep 10;

while [ -f "$pid" ]
do
	sleep 5;
done

echo "The start script has exited"
