resource "aws_s3_bucket" "jdt_bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  versioning {
    enabled = var.versioning
  }
  tags =  var.tags
}