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

# Setup Github

```
gh secret set AWS_ACCESS_KEY_ID --body "<your-access-key-id>"
gh secret set AWS_SECRET_ACCESS_KEY --body "<your-secret-access-key>"
gh secret set AWS_REGION --body "us-east-1"
```

# Create workflows
mkdir -p .github/workflows
touch .github/workflows/ci-cd.yml

# Push code
## Create dev branch
```
git add .
git commit -m "Initial commit: Flask app with Terraform infra layout"
git branch -M dev
git push -u origin dev
```

## Create test, prod branches
```
git checkout -b test
git push -u origin test

git checkout -b main
git push -u origin main
```
