FROM node:20

ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install necessary tools
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils curl

# Install g++ and dependencies
RUN apt-get install -y g++

# Add AdoptOpenJDK repository and install OpenJDK 17
RUN curl -sL https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
    echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/adoptopenjdk.list && \
    apt-get update && apt-get install -y adoptopenjdk-17-hotspot

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

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
CMD ["npm", "start"]
