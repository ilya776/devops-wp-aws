# 🌐 Terraform — Infrastructure for WordPress on AWS

This folder contains the complete Infrastructure as Code (IaC) setup for deploying a highly available WordPress environment on AWS using Terraform.

---

## 📁 Structure

terraform/
├── main.tf # All core AWS resources
├── variables.tf # Input variables
├── outputs.tf # Exported values (RDS/Redis endpoints, IAM keys, etc.)
└── README.md # This file


---

## 🧩 Components Deployed

- **VPC** with public/private subnets across 2 Availability Zones
- **Internet Gateway**, **Route Tables**, and **NAT Gateway**
- **EC2 Instance** in public subnet
- **RDS MySQL** (private, Multi-AZ)
- **ElastiCache Redis** (private)
- **Security Groups** for EC2, RDS, Redis
- **IAM User** with `ReadOnlyAccess`

---

## ⚙️ Variables (`variables.tf`)

| Variable               | Description                          | Default                          |
|------------------------|--------------------------------------|----------------------------------|
| `region`               | AWS region for deployment            | `"us-east-1"`                    |
| `vpc_cidr`             | VPC CIDR block                       | `"10.0.0.0/16"`                  |
| `public_subnet_cidrs`  | Public subnet CIDRs                  | `["10.0.1.0/24", "10.0.2.0/24"]` |
| `private_subnet_cidrs` | Private subnet CIDRs                 | `["10.0.101.0/24", "10.0.102.0/24"]` |
| `azs`                  | Availability zones                   | `["us-east-1a", "us-east-1b"]`   |

You can customize these by passing `-var` flags or using a `terraform.tfvars` file.

---

## 🚀 Deployment Instructions

### 1. Initialize Terraform

```bash
terraform init
```
### 2. Preview plan
```bash
terraform plan
```
### 3. Apply infrastructure
```bash
terraform apply
```
Confirm yes when prompted.

## 📤 Outputs (outputs.tf)

#### After apply, you'll get values like:

RDS Endpoint
Redis Endpoint
IAM Access Key ID + Secret
Example:
```bash
terraform output
```
## 🧪 Troubleshooting

Issue	Solution
No public IP on EC2	Ensure associate_public_ip_address = true
RDS not reachable from EC2	Check security group ingress and subnet routing
Terraform state issues	Use terraform refresh or clear .terraform folder
redis cache not working	Ensure SG allows port 6379 from EC2
## 🧼 Clean-up

To destroy all resources:
```bash
terraform destroy
```
## ✅ Status

Tested and fully working in us-east-1.
Compatible with Terraform AWS provider v5.x.


---
