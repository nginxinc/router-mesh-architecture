#!/bin/bash

if [ "$USE_NGINX_PLUS" = true ];
then
  echo "Installing NGINX Plus"

  wget -q -O /etc/ssl/nginx/CA.crt https://cs.nginx.com/static/files/CA.crt
  wget -q -O - http://nginx.org/keys/nginx_signing.key | apt-key add -
  wget -q -O /etc/apt/apt.conf.d/90nginx https://cs.nginx.com/static/files/90nginx
  printf "deb https://plus-pkgs.nginx.com/ubuntu `lsb_release -cs` nginx-plus\n" >/etc/apt/sources.list.d/nginx-plus.list

  # Install NGINX Plus
  apt-get update
  apt-get install -o Dpkg::Options::="--force-confold" -y nginx-plus

  /usr/local/sbin/generate_config -p /etc/nginx/router-mesh_config.yaml -t /etc/nginx/nginx-plus-router-mesh.conf.j2 > /etc/nginx/nginx.conf
else
  echo "Installing NGINX OSS"

  wget -q -O - http://nginx.org/keys/nginx_signing.key | apt-key add -
  printf "deb http://nginx.org/packages/ubuntu/ `lsb_release -cs` nginx\n" >/etc/apt/sources.list.d/nginx.list

  apt-get update
  apt-get install -o Dpkg::Options::="--force-confold" -y nginx

  /usr/local/sbin/generate_config -p /etc/nginx/router-mesh_config.yaml -t /etc/nginx/nginx-router-mesh.conf.j2 > /etc/nginx/nginx.conf
fi
