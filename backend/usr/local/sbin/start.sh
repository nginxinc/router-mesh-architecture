#!/bin/sh

NGINX_PID="/var/run/nginx.pid"

APP_PID=/var/run/unicorn.pid

if [  -f "$APP_PID" ]; then
    echo "Removing ${APP_PID}"
    rm -f $APP_PID
fi

unicorn -c /usr/src/app/unicorn.rb -D

nginx -c "/etc/nginx/nginx.conf" -g "pid $NGINX_PID;" &
echo "Started NGINX"

sleep 30

while [ -f "$NGINX_PID" ]
do
	sleep 5
done

echo "The start script has exited"
