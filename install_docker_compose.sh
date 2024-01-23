#!/bin/bash

# Function to get the latest release version from GitHub
get_latest_release() {
  curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | 
    grep '"tag_name":' |                                           
    sed -E 's/.*"([^"]+)".*/\1/'                                   
}

# Get the latest Docker Compose version
COMPOSE_VERSION=$(get_latest_release)

# Download the Docker Compose binary
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

# Verify the installation
docker-compose --version
