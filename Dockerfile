FROM nginx:1.15

MAINTAINER Karl Hughes <khughes.me@gmail.com>

ADD start.sh /usr/local/bin/

ONBUILD ADD conf /etc/nginx/conf.d/

# Disable daemon mode
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    cp -a /etc/nginx/conf.d /etc/nginx/.conf.d.orig && \
    rm -f /etc/nginx/conf.d/default.conf

WORKDIR /etc/nginx

CMD ["/usr/local/bin/start.sh"]
