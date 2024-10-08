# Use an official Node.js image that also has build tools for C++
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Update npm to the latest version
RUN npm install -g npm@latest

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Install gcc to support C++ compilation if needed
RUN apt-get update && apt-get install -y gcc g++ make

# Install nodemon globally if you use it for development
RUN npm install -g nodemon
# Expose the port your app will listen on (e.g., 5000)
EXPOSE 5000
# Start the application with nodemon
CMD ["nodemon", "index.js"]
