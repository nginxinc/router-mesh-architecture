FROM python:3.6.1-latest

RUN apt-get update && apt-get install -y \
	apt-transport-https \
    lsb-release \
	vim \
	wget

COPY etc /etc
COPY usr /usr

ENV BACKEND_ENDPOINT_URL="http://localhost/backend"
ENV USE_NGINX_PLUS=false

RUN cd /etc/ssl/nginx && \
	openssl req -nodes -newkey rsa:2048 -keyout key.pem -out csr.pem -subj "/C=US/ST=California/L=San Francisco/O=NGINX/OU=Professional Services/CN=web" && \
	openssl x509 -req -days 365 -in csr.pem -signkey key.pem -out certificate.pem; fi

RUN /usr/local/sbin/install-nginx.sh

# forward request logs to Docker log collector
RUN mkdir -p /var/log/nginx && \
    chmod a+w /var/log/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stdout /var/log/nginx/error.log

# install application
COPY app /app

#RUN chown -R nginx:www-data /app/
RUN

CMD

EXPOSE 443 80