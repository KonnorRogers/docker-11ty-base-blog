ARG NODE_VERSION="22"

# base image to use for docker-compose
FROM node:${NODE_VERSION} AS builder

# This needs to happen _inside_ of the FROM to be in "context"
ARG PG_MAJOR_VERSION="16"

# Install system dependencies.
RUN apt update -y && \
    # apt install -y <NECESSARY SYSTEM LIBRARIES> && \
    apt clean && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

# Copy everything over into the docker container under /app
COPY ./ ./

RUN npm install
CMD ["npm", "run", "start"]
