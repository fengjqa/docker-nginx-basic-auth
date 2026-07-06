#!/bin/sh

rm /etc/nginx/conf.d/default.conf || :
envsubst '${FORWARD_HOST} ${FORWARD_PORT} ${CLIENT_MAX_BODY_SIZE} ${LIMIT_CONN} ${LIMIT_RATE}' < auth.conf > /etc/nginx/conf.d/auth.conf
envsubst < auth.htpasswd > /etc/nginx/auth.htpasswd

exec nginx -g "daemon off;"
