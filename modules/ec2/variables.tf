variable "security_group_id" {
  description = "Security Group ID for EC2"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
}
