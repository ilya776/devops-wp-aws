#!/bin/bash

set -e

# Install Apache, PHP and required extensions
sudo apt update
sudo apt install -y apache2 php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc curl unzip wget

# Download and extract WordPress
cd /tmp
curl -O https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

# Move WordPress files to web root
sudo rm -rf /var/www/html/*
sudo cp -r wordpress/* /var/www/html/

# Set ownership and permissions
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Configure wp-config.php from environment variables
cd /var/www/html
sudo cp wp-config-sample.php wp-config.php

# Replace DB and Redis config in wp-config.php
sudo bash -c 'cat <<EOF >> wp-config.php

// Custom DB & Redis config
define("DB_NAME", getenv("WORDPRESS_DB_NAME"));
define("DB_USER", getenv("WORDPRESS_DB_USER"));
define("DB_PASSWORD", getenv("WORDPRESS_DB_PASSWORD"));
define("DB_HOST", getenv("WORDPRESS_DB_HOST"));

define("WP_REDIS_HOST", getenv("WORDPRESS_REDIS_HOST"));
define("WP_REDIS_PORT", getenv("WORDPRESS_REDIS_PORT"));
define("WP_REDIS_DISABLED", false);

EOF'
# Install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Create WordPress readonly user
sudo -u www-data wp user create readonly wpreadonly@example.com --role=editor --user_pass=readonly123 --path=/var/www/html

# Restart Apache
sudo systemctl restart apache2
