FROM php:7.0.5-fpm

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    lsb-release \
    vim \
    wget

COPY usr /usr

ENV BACKEND_ENDPOINT_URL="http://localhost/backend"

# install application
COPY app /app

RUN cd /app && SYMFONY_ENV=prod php composer.phar install --no-dev --optimize-autoloader

CMD ["/usr/local/sbin/start.sh"]

EXPOSE 443 80