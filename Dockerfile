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

# Use Nginx to serve the app
FROM nginx:alpine

# Copy built files to Nginx's HTML folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
