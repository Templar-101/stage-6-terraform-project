terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "stage6_bucket" {
  bucket = "henry-stage6-${random_id.bucket_id.hex}"

  tags = {
    Name = "Stage6Bucket"
    Env  = "Dev"
  }
}

provider "aws" {
  region  = "eu-west-2"
}
