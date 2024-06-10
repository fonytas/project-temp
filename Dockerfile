# Use the node:20.11.0-alpine base image
FROM node:20.11.0-alpine

# Install curl
RUN apk --no-cache add curl

# Create a directory to store downloaded files
WORKDIR /app

# Use curl to download the file from GitHub
RUN curl -o env_validator.js https://raw.githubusercontent.com/fonytas/env-validator/main/index.js

# Run the Node.js file
CMD ["node", "env_validator.js"]
