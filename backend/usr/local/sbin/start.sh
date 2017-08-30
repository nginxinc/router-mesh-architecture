#!/bin/sh

APP_PID=/var/run/unicorn.pid

if [  -f "$APP_PID" ]; then
    echo "Removing ${APP_PID}"
    rm -f $APP_PID
fi

unicorn -c /usr/src/app/unicorn.rb -D
echo "Started unicorn"

sleep 30

while [ -f "$APP_PID" ]
do
	sleep 5
done

echo "The start script has exited"
