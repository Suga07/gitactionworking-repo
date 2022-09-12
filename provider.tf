terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "me-south-1"
}

terraform {

  backend "s3" {

    bucket = "identifier-gitaction"

    key    = "gitbackup/terraform.tfstate"

    region = "me-south-1"

  }

}