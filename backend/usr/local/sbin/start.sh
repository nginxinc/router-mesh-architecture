#!/bin/sh
APP_PID="/var/run/unicorn.pid"
NGINX_PID="/var/run/nginx.pid"

# The uniconr.pid file can only be managed by the user that started it
# and restarting the container will result in an error indicating that the
# unicorn.pid is stale
echo "Looking for $APP_PID"

if [ -f "$APP_PID" ]; then
	rm -rf "$APP_PID"
fi

unicorn -c /usr/src/app/unicorn.rb -D
echo "Started unicorn app"

nginx -c "/etc/nginx/nginx-router-mesh.conf" -g "pid $NGINX_PID;" &
echo "Started NGINX"

sleep 30

while [ -f "$NGINX_PID" ] && [ -f "$APP_PID" ]
do
	sleep 5
done

echo "The start script has exited"
