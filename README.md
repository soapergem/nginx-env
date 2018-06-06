# nginx-env

This Docker image is designed to use Docker environmental variables with NGinx configuration files. It is an updated fork of [Martin van Beurden's docker-nginx image](https://github.com/chadoe/docker-nginx).

## Using with the Default vhosts.conf file

Default usage with a `php-fpm` container requires no custom configuration.

1. Start your PHP container: `docker run --name php-fpm-api -v $(pwd):/var/www php:fpm`
2. Start this NGinx container: `docker run --link php-fpm-api -e NGINX_HOST=php-fpm-api shiphp/nginx-env`

## Custom usage

1. Create a new Dockerfile and add your config files

```Dockerfile
FROM shiphp/nginx-env

ONBUILD ADD <PATH_TO_YOUR_CONFIGS> /etc/nginx/conf.d/

```

2. Place nginx site config file in directory `./conf`, these will be placed in `/etc/nginx/conf.d/`
3. `docker build -t mynew/nginx .`
4. `docker run -d mynew/nginx`

Config files may contain environment variables in the form of `$ENV{"environmentvariablename"}`. These will be replaced when the container starts.
