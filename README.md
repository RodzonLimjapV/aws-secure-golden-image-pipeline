# AWS Secure Golden Image Pipeline (CIS Hardened)

## Overview
This project demonstrates an end-to-end DevOps pipeline to build, validate, and deploy CIS-hardened Oracle Linux 9 AMIs on AWS using:

- Packer (Golden Image Build)  
- Ansible (CIS Hardening)  
- Terraform (Infrastructure as Code)  
- GitHub Actions (CI/CD Automation)  

---

## Architecture Diagram

High-level flow:

Packer → Hardened AMI → Terraform → EC2 → Validation → Artifacts

---

## Key Features

- CIS Level 1 Hardening (RHEL9 benchmark)
- Immutable Infrastructure (Golden AMI)
- Automated Compliance Artifact Generation
- Secure Access Configuration (SSH hardening, SELinux enforcing)
- CI/CD Pipeline with Preview Mode (safe deployment)

---

## Security Controls Implemented

- SELinux: Enforcing  
- SSH: Root login disabled, password authentication disabled  
- Auditd: Enabled with audit rules  
- Kernel Modules: Restricted (cramfs, squashfs)  
- User Hardening: secadmin privileged user  

---

## Deployment

### Prerequisites

- AWS Account with IAM access  
- Terraform installed (>= 1.0)  
- AWS CLI configured OR GitHub Actions secrets set  
- Existing EC2 Key Pair  

---

### Local Deployment (Terraform)

terraform init  
terraform validate  
terraform plan -var="key_name=<your-keypair-name>"  
terraform apply -var="key_name=<your-keypair-name>"  

---

### CI/CD Deployment (GitHub Actions)

This project includes a GitHub Actions pipeline that:

- Runs on push to `main`
- Performs:
  - terraform init
  - terraform validate
  - terraform plan (preview mode)

#### Required GitHub Secrets

AWS_ACCESS_KEY_ID  
AWS_SECRET_ACCESS_KEY  
KEY_NAME  

---

### Accessing the Instance

ssh -i <your-key>.pem ec2-user@<public-ip>  
sudo su - secadmin  

---

## Compliance Artifacts

Generated during build and stored in:

/opt/cis-artifacts/

- playbook_output.txt  
- modprobe_output.txt  
- auditctl_output.txt  

---

## Validation

lsblk  
getenforce
sudo systemctl status auditd

grep -E "cramfs|squashfs" /opt/cis-artifacts/modprobe_output.txt  
tail -20 /opt/cis-artifacts/playbook_output.txt  

---

## Design Principles

- Immutable Infrastructure  
- Security by Default  
- Automation First  
- Auditability  

---

## Outcome

- Hardened and reusable AMI  
- Repeatable infrastructure deployment  
- Compliance-ready system with audit artifacts  

---

## Author

Rodzon V. Limjap
Senior DevOps / Cloud Engineer  
AWS | Terraform | Security | Automation  
