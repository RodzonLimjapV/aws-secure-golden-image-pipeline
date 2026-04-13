variable "ami_id" {
  default = "ami-0302fe6469baa0e63"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair"
}
