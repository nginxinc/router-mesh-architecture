#!/bin/sh

php -S 0.0.0.0:8080 -t /app/web/ &
echo "Started PHP Webserver"

echo launched processes;
sleep 10;


while true;
do
    sleep 5;
done

echo "The start script has exited"
