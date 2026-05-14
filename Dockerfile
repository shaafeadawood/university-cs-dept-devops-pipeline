FROM nginx:alpine

COPY pages/ /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

# FORCE nginx to use correct index file
RUN rm -f /usr/share/nginx/html/index.html
RUN cp /usr/share/nginx/html/pages/index.html /usr/share/nginx/html/index.html

EXPOSE 80