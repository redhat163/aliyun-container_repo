# Use the official Node.js 18 Alpine image for a lightweight environment
FROM node:18-alpine

# Define a build-time argument for the service directory, default is 'placeholder'
ARG SVC_DIR=.

# Switch to the 'node' user to avoid running as root
USER node

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the application files from the specified service directory to /app
COPY --chown=node:node ${SVC_DIR} .

# Install the dependencies defined in package.json using a clean install
RUN npm ci

# Build the Vue.js application for production
RUN npm run build

# Expose port 5173 to allow external access to the application
EXPOSE 5173

# Set environment variable for the application port
ENV PORT 5173

# Set environment variable to allow external access
ENV HOST 0.0.0.0

# Command to run the Vue.js development server, binding to all interfaces
CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0" ]
