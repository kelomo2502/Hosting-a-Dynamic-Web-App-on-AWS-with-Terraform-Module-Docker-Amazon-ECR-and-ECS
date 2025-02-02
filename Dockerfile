# Use official Node.js image as base
FROM node:18-alpine AS build

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY spaceApp/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY spaceApp ./

# Build the React app
RUN npm run build

# Stage 2: Serve the React app with Nginx
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html

# Generate the Nginx configuration file dynamically
RUN echo "user nginx;\n\
worker_processes auto;\n\
error_log /var/log/nginx/error.log warn;\n\
pid /var/run/nginx.pid;\n\
events {\n\
    worker_connections 1024;\n\
}\n\
http {\n\
    include /etc/nginx/mime.types;\n\
    default_type application/octet-stream;\n\
    log_format main '\$remote_addr - \$remote_user [\$time_local] \"\$request\" '\n\
                    '\$status \$body_bytes_sent \"\$http_referer\" '\n\
                    '\"\$http_user_agent\" \"\$http_x_forwarded_for\"';\n\
    access_log /var/log/nginx/access.log main;\n\
    sendfile on;\n\
    tcp_nopush on;\n\
    server {\n\
        listen 80;\n\
        root /usr/share/nginx/html;\n\
        index index.html;\n\
        location / {\n\
            try_files \$uri \$uri/ /index.html;\n\
        }\n\
        error_page 404 /404.html;\n\
        location = /404.html {\n\
            internal;\n\
        }\n\
        error_page 500 502 503 504 /50x.html;\n\
        location = /50x.html {\n\
            internal;\n\
        }\n\
    }\n\
}" > /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]