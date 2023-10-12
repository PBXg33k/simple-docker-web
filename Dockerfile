FROM nginx:alpine

LABEL author=development@oguzhanuysal.eu

RUN apk add --no-cache curl

COPY ./src/ /usr/share/nginx/html

HEALTHCHECK --interval=1m --timeout=3s CMD curl --fail http://localhost/ || exit 1

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
