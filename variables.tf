variable "aws_region"{
  default = "ap-south-1"
}

variable "key_name" {
  default = "keypair1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "security_groups" {
  default = "SSH1"
}

variable "tag_name" {
  default = "jdtinstance"
}

variable "ami_id" {
  default = "ami-0fd05997b4dff7aac"
}

variable "versioning" {
  type = bool
  default = true
}

variable "acl" {
  type =  string 
  default = "private"
}

variable "bucket_prefix" {
  type = string
  default = "bucketjdt"
}

variable "tags" {
  default = {
    Environment= "DEV"
    terraform = "true"
  }
}