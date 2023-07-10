#!/bin/bash

sudo apt update
sudo apt install docker.io -y

sudo usermod -aG docker $USER
newgrp docker

sudo apt update
sudo apt install openjdk-17-jre -y
java -version

# Import Jenkins GPG key
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository to apt sources
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists
sudo apt-get update

# Install Jenkins
sudo apt-get install jenkins -y

# Display initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
