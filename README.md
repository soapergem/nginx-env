# nginx-env

This Docker image is designed to use Docker environmental variables with NGinx configuration files.
This is a fork of [shiphp/nginx-env](https://github.com/shiphp/nginx-env) that works with Alpine.

There is a Docker Compose script illustrating usage in the samples directory.
You need to ensure that the path of the shared volume is the same in both this
container and your PHP/FPM container (showcased in the compose script).
Finally you'll need to specify the `NGINX_HOST` environment variable,
as outlined in [shiphp/nginx-env](https://github.com/shiphp/nginx-env),
and ensure that the PHP/FPM container is named to match this value.
