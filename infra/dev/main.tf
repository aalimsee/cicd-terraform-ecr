


terraform {
  backend "s3" {
    bucket = "sctp-ce9-tfstate"
    key    = "lach-cicd-tf-ecr/dev/terraform.tfstate"
    region = "us-east-1"
  }
}


# ---Create the ECR Repository with image scanning enabled
# --------------------------------------------------------

resource "aws_ecr_repository" "ecr_repo" {
  name = "lach"

  image_scanning_configuration {
    scan_on_push = true
  }

  # Optionally, you can set encryption and lifecycle policies if needed.
  encryption_configuration {
    encryption_type = "AES256" # Default is AES256 encryption, you can also use KMS.
  }

  lifecycle {
    prevent_destroy = false # Allows the resource to be destroyed
  }
}
