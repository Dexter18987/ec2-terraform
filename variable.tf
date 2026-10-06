variable "key_name" {
  default     = "localhost"
  type        = string
  description = " ec2 instance key pair name"

}
#var key_name=localhost or --var-file=path
variable "ssh_port" {
  default     = 22
  type        = number
  description = "open port ssh"
}

variable "cidr_block_ssh_port" {
  default     = "0.0.0.0/0"
  type        = string
  description = "ssh open cidr block"
}
