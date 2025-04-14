# cicd-terraform-ecr
repo to test workflows with terraform ecr on multi environments

# Overview
Aiming for a clean, structured, multi-environment setup with:

✅ GitHub Actions for CI/CD

✅ Terraform for IaC

✅ Docker + Flask app

✅ ECR for image storage

✅ Separate dev, test (staging), and prod workflows.

# High-Level Flow
Event                  Action                                              Target

Push to dev branch,    Build Docker image, push to ECR (lach:dev-<SHA>),   Terraform deploy to dev

Pull Request to test,  Build Docker image, push to ECR (lach:test-<SHA>),  Terraform plan/apply to test

Merge to main branch,  Build Docker image, push to ECR (lach:prod-<SHA>),  Terraform deploy to prod
