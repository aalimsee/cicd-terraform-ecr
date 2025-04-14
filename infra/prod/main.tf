


terraform {
  backend "s3" {
    bucket = "sctp-ce9-tfstate"
    key    = "lach-cicd-tf-ecr/prod/terraform.tfstate"
    region = "us-east-1"
  }
}
