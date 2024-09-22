#!/bin/bash
sudo su
apt-get -y update
apt-get -y install nginx


# Variables
APP_DIR="/var/www/myapp"
GIT_REPO="https://github.com/DSvidyutbhaskariitj/VCC_PROJECT.git"
BRANCH="main"
NGINX_CONF="/etc/nginx/sites-available/myapp/default"
NGINX_ENABLED="/etc/nginx/sites-enabled/myapp"
DOMAIN_NAME="example.com"

# Step 1: Pull latest code from Git repository
echo "Pulling the latest code from Git repository..."
if [ -d "$APP_DIR" ]; then
    # If the directory exists, navigate to it and pull the latest changes
    cd $APP_DIR || exit
    git fetch origin
    git checkout $BRANCH
    git pull origin $BRANCH
else
    # If the directory does not exist, clone the repository
    sudo git clone $GIT_REPO $APP_DIR
    cd $APP_DIR || exit
    git checkout $BRANCH
fi

# Step 2: Install dependencies (Node.js example)
echo "Installing dependencies..."
#npm install

# Step 3: Build the application (if needed)
echo "Building the application..."
#npm run build

# Step 4: Set up Nginx configuration
echo "Configuring Nginx..."

sudo rm /etc/nginx/sites-enabled/default 

# Create the Nginx config file if it doesn't exist
mkdir /etc/nginx/sites-available/myapp

sudo tee $NGINX_CONF > /dev/null <<EOL
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/myapp;  # Change this to the actual root of your site
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOL
else
    echo "Nginx configuration already exists."
fi

# Step 5: Enable the Nginx configuration
if [ ! -L "$NGINX_ENABLED" ]; then
    echo "Enabling the Nginx configuration..."
    sudo ln -s $NGINX_CONF $NGINX_ENABLED
else
    echo "Nginx configuration already enabled."
fi

# Step 6: Test Nginx configuration
echo "Testing Nginx configuration..."
sudo nginx -t

if [ $? -eq 0 ]; then
    echo "Nginx configuration is valid."
else
    echo "Nginx configuration failed."
    exit 1
fi

# Step 7: Reload Nginx
echo "Reloading Nginx..."
sudo systemctl reload nginx

# Step 8: Set ownership and permissions for the app directory
echo "Setting permissions..."
sudo chown -R www-data:www-data $APP_DIR
sudo chmod -R 755 $APP_DIR

echo "Deployment complete!"
