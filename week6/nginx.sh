#!/bin/bash

# Update the package list
sudo apt-get update

# Install Nginx
sudo apt-get install -y nginx

# Ensure Nginx is started
sudo systemctl start nginx
sudo systemctl enable nginx

# Get the hostname of the machine
HOSTNAME=$(hostname)

# Modify the default Nginx welcome page
sudo sed -i "s/Welcome to nginx\!/Welcome to \$HOSTNAME/" /var/www/html/index.nginx-debian.html

# Replace placeholder with actual hostname in the html
sudo sed -i "s/\$HOSTNAME/$HOSTNAME/" /var/www/html/index.nginx-debian.html

# Restart Nginx to apply changes
sudo systemctl restart nginx

echo "Nginx has been installed and configured on $HOSTNAME"

