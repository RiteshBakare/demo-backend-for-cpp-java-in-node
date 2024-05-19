FROM node:20

FROM multiarch/debian:buster-slim  

ENV DEBIAN_FRONTEND=noninteractive

# Update package lists
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils curl openjdk-11-jdk g++

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies (assuming Node.js project)
RUN npm install

# Copy the application source code
COPY . .

# Expose Node.js application port (adjust if needed)
EXPOSE 8080

# Start the application (adjust command based on your project)
CMD [ "npm", "start" ]
