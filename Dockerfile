# Use an official Node.js runtime as a parent image
FROM node:14-alpine as build-stage

# Set the working directory in the container
WORKDIR /app

# Copy the package.json files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your app's source code
COPY . .

# Build your Svelte app
RUN npm run build

# Use Nginx to serve the app
FROM nginx:stable-alpine as production-stage

# Copy the build output to replace the default nginx contents
COPY --from=build-stage /app/public /usr/share/nginx/html

# Expose port 80 to the outside once the container has launched
EXPOSE 80

# Define the command to run your app using CMD which defines your runtime
CMD ["nginx", "-g", "daemon off;"]
