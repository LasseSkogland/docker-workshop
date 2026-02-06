#!/bin/sh
# Detect OS and install Docker appropriately

# Source OS information
. /etc/os-release

# Install prerequisites
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings

# Add Docker's official GPG key
sudo curl -fsSL https://download.docker.com/linux/$ID/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Determine the appropriate suite name based on OS
if [ "$ID" = "ubuntu" ]; then
    SUITE="${UBUNTU_CODENAME:-$VERSION_CODENAME}"
else
    SUITE="$VERSION_CODENAME"
fi

# Add the repository to Apt sources
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/$ID
Suites: $SUITE
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin