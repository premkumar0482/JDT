terraform {
  backend "s3" {
    bucket = "my-dev-state-bucket"
    key = "keypair1"
    region = "ap-south-1"
    dynamodb_table = "my-dynamodb-table"
  }
}