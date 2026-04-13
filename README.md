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

- CIS Level 1 Hardening
- Immutable Infrastructure (Golden AMI)
- Automated Compliance Artifact Generation
- Secure Access Configuration
- CI/CD Pipeline with Preview Mode

---

## Deployment

terraform init  
terraform apply -var="key_name=<your-key>"

---

## Artifacts

/opt/cis-artifacts/
- playbook_output.txt
- modprobe_output.txt
- auditctl_output.txt

---

## Outcome

- Secure hardened AMI
- Repeatable infrastructure deployment
- Audit-ready outputs
