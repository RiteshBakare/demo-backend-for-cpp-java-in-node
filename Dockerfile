FROM node:20

# Install g++ and OpenJDK
RUN apt-get update && \
    apt-get install -y g++ && \
    apt-get install -y openjdk-11-jdk

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Expose port and start the application
EXPOSE 8080
CMD [ "npm", "start" ]
