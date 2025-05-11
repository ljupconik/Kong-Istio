terraform {
  required_version = ">= 1.0.0" # Minimum Terraform version

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Recommended: Pin to latest 5.x
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}