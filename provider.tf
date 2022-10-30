terraform {

  # backend "s3" {
  #   key        = "terraform/terraform.tfstate"
  #   bucket     = "cost-optimizer"
  #   region     = "ap-south-1"
  #   access_key = "AKIA4T7KZQL345MQJX4V"
  #   secret_key = "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"
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0.0"

}

provider "aws" {
  region     = var.region
  access_key = var.access-key
  secret_key = var.secret-key
}