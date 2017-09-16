FROM ruby:2.2.3

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    lsb-release \
    vim \
    wget && \
    mkdir -p /tmp/sockets && \
    bundle config --global frozen 1 && \
    mkdir -p /usr/src/app/log

COPY usr /usr
WORKDIR /usr/src/app
COPY app /usr/src/app
RUN bundle install

EXPOSE 80 443

CMD ["/usr/local/sbin/start.sh"]
