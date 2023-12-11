################################################################################
# Version Terraform
################################################################################
terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.73"
    }
  }

  ################################################################################
  # Backend States Terraform
  ################################################################################
  backend "s3" {
    bucket         = "kantox-dev-s3-states"
    key            = "terraform-tfstate"
    region         = "us-east-1"
    dynamodb_table = "kantox-dev-dynamodb-states"
    profile        = "kantox"
  }
}