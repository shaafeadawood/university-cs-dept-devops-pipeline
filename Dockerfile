FROM nginx:alpine

# Copy the entire repository (pages/, assets/, etc.) into the nginx web root
# Render requires a Dockerfile at the repository root. This uses the repo root
# as build context so static files are available at /usr/share/nginx/html.
COPY . /usr/share/nginx/html

EXPOSE 80

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
