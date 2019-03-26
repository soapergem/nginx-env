#!/bin/ash

# Restore original default config if no config has been provided
if [[ ! "$(ls -A /etc/nginx/conf.d)" ]]; then
    cp -a /etc/nginx/.conf.d.orig/. /etc/nginx/conf.d 2>/dev/null
fi

# Replace variables $ENV{<environment varname>}
function ReplaceEnvironmentVariable() {
    grep -rl "\$ENV{\"$1\"}" $3|xargs -r \
        sed -i "s|\\\$ENV{\"$1\"}|$2|g"
}

# Replace all variables
env | while IFS= read -r line; do
    name="${line%%=*}";
    value=$(eval echo "\$$name");
    ReplaceEnvironmentVariable "${name}" "${value}" /etc/nginx/conf.d/*
done

# Run nginx
exec /usr/sbin/nginx
