# Use the node:20.11.0-alpine base image
FROM node:20.11.0-alpine

# Install curl
RUN apk --no-cache add curl

# Create a directory to store downloaded files
WORKDIR /app

# Copy the /envs/.development directory from the project to the /app directory in the container
COPY ./envs/.env.development /app/envs/.env.development

# Copy the /docs/ENV.md directory from the project to the /app directory in the container
COPY ./docs/ENV.md /app/docs/ENV.md

# Use curl to download the file from GitHub
RUN curl -o validate_env.sh https://raw.githubusercontent.com/fonytas/env-validator/main/validate_env2.sh

# add execute permissions to the file
RUN chmod +x validate_env.sh

# Run the script
CMD ["./validate_env.sh"]