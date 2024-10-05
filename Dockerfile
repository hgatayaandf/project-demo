# syntax=docker/dockerfile:1
# webhook test hook
# Use a specific Node.js version for consistency
FROM node:18.17.0-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files for dependencies installation
COPY package.json yarn.lock ./

# Install production dependencies
RUN yarn install --production --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Run the application
CMD ["node", "src/index.js"]

# Expose the application port
EXPOSE 3000


