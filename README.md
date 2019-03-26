# nginx-env

This Docker image is designed to use Docker environmental variables with NGinx configuration files.
This is a fork of [shiphp/nginx-env](https://github.com/shiphp/nginx-env) that works with Alpine.

There is a Docker Compose script illustrating usage in the samples directory.
With the way it's set up, you'll have to create a `code` directory and put your code in it.
You also need to ensure that the path of the shared volume is the same in both this container
and your PHP/FPM container (which is already done by the compose script). Finally you'll need
to specify the `NGINX_HOST` environment variable as outlined in
[shiphp/nginx-env](https://github.com/shiphp/nginx-env), and enusre that the PHP/FPM container
is named to match this value.
