FROM nginx:alpine

# Copy the entire repository (pages/, assets/, etc.) into the nginx web root
# Render requires a Dockerfile at the repository root. This uses the repo root
# as build context so static files are available at /usr/share/nginx/html.
## Copy site files into nginx web root so index.html is served from '/'
# Copy HTML pages into the web root
COPY pages/ /usr/share/nginx/html/
# Copy static assets (css, images) into assets/ so relative paths work
COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 80

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
