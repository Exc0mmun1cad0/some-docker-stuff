FROM nginx:stable-alpine AS runner 

RUN apk --no-cache add bash

COPY config/nginx/default.conf /etc/nginx/conf.d/default.conf
