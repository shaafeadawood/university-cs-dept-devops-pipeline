FROM nginx:alpine

COPY pages/ /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 80