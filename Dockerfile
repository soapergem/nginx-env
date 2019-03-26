FROM nginx:1.15-alpine

# Based on shiphp/nginx-env
LABEL MAINTAINER soapergem@gmail.com

ENV DATA_DIR /var/www/html
ENV NGINX_HOST php-fpm-api

COPY docker-entrypoint.sh /usr/local/bin/
COPY conf/default.conf /etc/nginx/conf.d/

# Add the www-data user
RUN set -x ; \
    addgroup -g 82 -S www-data ; \
    adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

# Disable daemon mode
RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
    # Backup configs
    cp -a /etc/nginx/conf.d /etc/nginx/.conf.d.orig && \
    rm -f /etc/nginx/conf.d/default.conf && \
    # Make sure the data directory is created and ownership correct
    mkdir -p $DATA_DIR && \
    chown -R www-data:www-data $DATA_DIR

# Add some debugging
# RUN sed -re '1h;2,$H;$!d;g' -e \
#     "s/log_format\s+main[^;]+;/\0\n    log_format  scripts '\$document_root\$fastcgi_script_name > \$request';/" \
#     /etc/nginx/nginx.conf | tee /etc/nginx/nginx.conf.swap && \
#     mv /etc/nginx/nginx.conf.swap /etc/nginx/nginx.conf

WORKDIR /etc/nginx
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
