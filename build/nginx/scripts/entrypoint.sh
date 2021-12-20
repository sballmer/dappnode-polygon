#!/bin/sh

# exit script on any error
set -e

if [ ! -f "/etc/nginx/.htpasswd" ]; then
  echo "NGINX service >> INFO: generating basic AUTH for user: ${AUTH_USER}"
  printf "${AUTH_USER:-user}:$(openssl passwd -5 ${AUTH_PASSWORD-password})\n" >> /etc/nginx/.htpasswd
fi

exec "$@"
