# 📦 WordPress Deployment Script

This folder contains a Bash script that automates the installation and configuration of WordPress on an EC2 instance.

The script is designed to be used after the AWS infrastructure is provisioned using Terraform (see `../terraform`).

---

## 🔧 Prerequisites

This script is intended to be run **on the EC2 instance itself** (Ubuntu-based) after SSH access is established.

Ensure:

- Apache2 is not already running
- You have exported all required environment variables (see below)
- The instance has internet access

---

## 📁 Files

deploy/
├── deploy.sh # The main deployment script
└── README.md # This file


---

## 🌐 Required Environment Variables

Before running the script, set the following environment variables on the EC2 instance:

```bash
export WORDPRESS_DB_NAME=wordpress
export WORDPRESS_DB_USER=admin
export WORDPRESS_DB_PASSWORD=strongpassword
export WORDPRESS_DB_HOST=your-rds-endpoint.amazonaws.com

export WORDPRESS_REDIS_HOST=your-redis-endpoint.amazonaws.com
export WORDPRESS_REDIS_PORT=6379
```
You can use .env.example in the root folder as a reference.
## 🚀 How to Run

SSH into your EC2 instance, then:
```bash
chmod +x deploy.sh
./deploy.sh
```
The script will:

Install Apache2, PHP, and required PHP extensions
Download the latest WordPress release
Copy files to /var/www/html
Generate wp-config.php with database and Redis configuration
Set correct permissions for Apache to serve WordPress
Restart Apache
## ⚠️ Important Notes

The script assumes Apache will serve files from /var/www/html
If wp-config.php exists, it will be overwritten
Redis settings are optional, but expected if you use the Redis plugin
## 🧪 Troubleshooting

Problem	Solution
WordPress not loading	Check Apache status and permissions
Error establishing a DB connection	Verify RDS is reachable and credentials match
Redis not connected	Check Redis endpoint and plugin activation
wp-config.php missing/incorrect	Re-run the script or manually edit it
## ✅ Status

Script tested and verified on:

Ubuntu 22.04 EC2
Apache2 + PHP 8
WordPress 6.x
RDS MySQL 8
Redis (ElastiCache)

---