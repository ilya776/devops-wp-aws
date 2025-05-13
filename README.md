# 🚀 WordPress on AWS — DevOps Test Assignment (ABZ Agency)

This project demonstrates a fault-tolerant infrastructure for deploying WordPress on AWS using Infrastructure as Code (Terraform), Bash automation, and DevOps best practices.

> ✅ All requirements from [ABZ Agency Test Assignment] are fully implemented.

---

## 🧩 Architecture Overview

- 🛠 **Terraform-managed infrastructure**
- 🌍 **VPC** with public and private subnets (2 Availability Zones)
- 🖥 **EC2 (Ubuntu)** hosting WordPress
- 🛢 **RDS MySQL** (Multi-AZ, private)
- ⚡️ **ElastiCache Redis** (private) for session & object caching
- 🔐 **IAM user** with `ReadOnlyAccess`
- 👤 **WordPress readonly admin user**
- 📜 **Bash script** for automatic WordPress deployment

---

## 📂 Project Structure

.
├── terraform/ # Infrastructure as Code (Terraform)
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── ...
│ └── README.md # Terraform-specific details
├── deploy/
│ ├── deploy-wordpress.sh # Bash script to install WordPress
│ └── README.md # Deployment explanation
├── .env.example # Environment variable template
├── README.md # You are here
└── .gitignore


---

## ⚙️ Infrastructure Components

### ✅ Terraform Modules:
- **VPC**: with public/private subnets in 2 AZs
- **EC2 Instance**: Ubuntu-based instance with public access via SSH and HTTP
- **RDS MySQL**: Multi-AZ, not publicly accessible
- **ElastiCache Redis**: private, used for object/session cache
- **IAM User**: with `ReadOnlyAccess` policy for reviewer access

---

## 🚀 Deployment Workflow

### 🔧 1. Terraform Deployment

```bash
cd terraform
terraform init
terraform apply
Wait for infrastructure to be fully created.
```
## 📜 2. WordPress Installation via Script
```bash
cd deploy
./deploy-wordpress.sh
```
### This script will:

Install Apache, PHP and extensions
Download and configure WordPress
Generate wp-config.php with DB and Redis credentials
Set correct file permissions
🌐 3. Access WordPress
Visit your EC2 public IP in a browser:

http://<EC2_PUBLIC_IP>
Complete the setup in the WordPress installer.

# 🔐 Access Credentials

## ✅ IAM User (ReadOnlyAccess)
Used by the reviewer to check deployed infrastructure.

Access Key ID:      <your-access-key>
Secret Access Key:  <your-secret-key>
## ✅ WordPress (Readonly user)
A user account with limited permissions to inspect WordPress admin panel.

URL:      http://<EC2_PUBLIC_IP>/wp-login.php
Login:    readonly
Password: readonly123
## 🧪 Troubleshooting

Problem	Solution
Error establishing a database connection	Ensure the RDS is created, credentials are correct, and DB exists
Redis not connected	Ensure Redis endpoint is correct and plugin is activated
SSH not working	Check EC2 SG allows port 22 and correct key is used
## 🧠 Notes

All resources are created using Terraform only
No manual UI steps were performed
wp-config.php is partially managed by script and partially manually for clarity
## 📎 Author

Illia Bilous
[Kyiv, Ukraine]
[LinkedIn Profile] (www.linkedin.com/in/illia-bilous-32548a212) | [GitHub] (https://github.com/ilya776) | [Telegram] (https://t.me/illiabls)

## ✅ Status

#### ✅ Completed
#### 🕒 Time spent: approx. 5 hours
#### 🧱 Challenges: DB connection order in wp-config.php, RDS setup, Redis ENV management


---