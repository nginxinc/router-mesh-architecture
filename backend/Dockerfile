FROM ruby:2.2.3

RUN apt-get update && apt-get install -y \
	apt-transport-https \
	lsb-release \
	vim \
	wget

COPY etc /etc
COPY usr /usr

ENV USE_NGINX_PLUS=false

RUN cd /etc/ssl/nginx && \
	openssl req -nodes -newkey rsa:2048 -keyout key.pem -out csr.pem -subj "/C=US/ST=California/L=San Francisco/O=NGINX/OU=Professional Services/CN=backend" && \
	openssl x509 -req -days 365 -in csr.pem -signkey key.pem -out certificate.pem

RUN /usr/local/sbin/install-nginx.sh

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
		ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir -p /tmp/sockets

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app/log
WORKDIR /usr/src/app

COPY app /usr/src/app
RUN bundle install

EXPOSE 80 443

CMD ["/usr/local/sbin/start.sh"]
