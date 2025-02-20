# Stage 1: Build the Angular app
FROM node:14 AS build-stage

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (to cache dependencies)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the Angular project
COPY . .

# Build the Angular app (production build)
RUN RUN rm -rf dist &&  npm run build --prod


# Stage 2: Serve the Angular app using Nginx
FROM nginx:alpine AS production-stage

# Copy the built Angular files from the previous stage
COPY --from=build-stage /app/dist/my-clock /usr/share/nginx/html

# Expose port 80 (Nginx default)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
