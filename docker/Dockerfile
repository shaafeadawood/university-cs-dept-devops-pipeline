# Use the official lightweight Nginx image as the base for a small production image
# Base image: nginx:stable-alpine (small, secure, maintained)
FROM nginx:stable-alpine

# Maintainer metadata (optional)
LABEL org.opencontainers.image.authors=""

# Working directory inside the container where nginx serves files
WORKDIR /usr/share/nginx/html

# Remove the default static files provided by the base image to ensure a clean copy
RUN rm -rf /usr/share/nginx/html/*

# Copy the website files into the nginx html directory.
# - copy the HTML pages to the container root so `index.html` is served at `/`
# - copy the `assets/` directory so CSS, fonts and images are preserved at `/assets/...`
# Note: Using a simple COPY keeps paths identical to the repository layout.
COPY pages/ /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

# Ensure files are readable by the nginx process
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80 for HTTP traffic (standard for Nginx)
EXPOSE 80

# Start nginx in the foreground. This is the recommended way to run nginx in Docker
# so the container stays alive and can be managed by the Docker runtime.
CMD ["nginx", "-g", "daemon off;"]

# Notes:
# - The container serves the static site at http://<host>:80/
# - Build context should be the repository root so the `pages/` and `assets/` folders are available to COPY
# - If you need custom nginx configuration later, add an nginx.conf and COPY it to /etc/nginx/conf.d/default.conf
