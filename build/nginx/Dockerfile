FROM nginx:1.21.4-alpine

RUN apk update && apk add openssl

COPY ./includes /etc/nginx/includes/
COPY ./scripts/entrypoint.sh /
COPY ./proxy.conf.template /proxy.conf.template

# Remove nginx default configuration
RUN rm -Rf /etc/nginx/conf.d/*

# Handles basic auth configuration
ENTRYPOINT ["/bin/sh", "/entrypoint.sh" ]

# Enable specific ENV in nginx conf before running service
CMD ["/bin/sh" , "-c" , "envsubst '$${INT_HTTP},$${EXT_HTTP},$${INT_WS},$${EXT_WS},$${WS_NAME}' < /proxy.conf.template > /etc/nginx/conf.d/proxy.conf && exec nginx -g 'daemon off;'"]
