# Configure the AWS Provider
provider "aws" {
  region = var.names["region"]

}

terraform {
  backend "s3" {
    bucket = "andrew-bucket-2023"
    key    = "./terraform.tfstate"
    region = "us-east-1"
  }
}


