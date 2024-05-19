FROM node:20

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y g++ && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the application source code
COPY . .

# Expose the application port
EXPOSE 8080

# Start the application
CMD [ "npm", "start" ]
