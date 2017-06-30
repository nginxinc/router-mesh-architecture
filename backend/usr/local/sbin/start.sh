#!/bin/sh

NGINX_PID="/var/run/nginx.pid"

nginx -c "/etc/nginx/nginx-router-mesh.conf" -g "pid $NGINX_PID;" &
echo "Started NGINX"

sleep 30

while [ -f "$NGINX_PID" ]
do
	sleep 5
done

echo "The start script has exited"
