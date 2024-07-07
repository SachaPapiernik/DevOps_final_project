#!/bin/bash

# Update and install required packages
sudo apt-get update
sudo apt-get install -y docker.io git nginx

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to the Docker group
sudo usermod -a -G docker $(whoami)

# Clone the repository as the current user
sudo -i -u $(whoami) git clone https://github.com/SachaPapiernik/python-api.git /home/$(whoami)/api-repo

# Change to the repository directory
cd /home/$(whoami)/api-repo

# Build and run the Docker container
sudo docker build -t api-image .
sudo docker run -d -p 8080:8080 api-image

# Configure Nginx
cat <<EOL | sudo tee /etc/nginx/sites-available/flask_app
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOL

# Enable the Nginx configuration and restart Nginx
sudo ln -s /etc/nginx/sites-available/flask_app /etc/nginx/sites-enabled
sudo systemctl restart nginx