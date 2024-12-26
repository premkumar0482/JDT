provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "jdt_bucket" {
  bucket = "bucketjdt"
  #bucket_prefix = var.bucket_prefix
  versioning {
    enabled = true
  }
  tags = {
    Environment= "probs"
  }
}