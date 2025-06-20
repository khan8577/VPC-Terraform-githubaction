variable "My_Sg_id" {
    description = "SG ID for load balancer"
    type = string
  
}

variable "subnets" {
    description = "Subnets for load balancer"
    type = list(string)
  
}

variable "vpc_id" {
    description = "VPC ID for TG"
    type = string
  
}

variable "instances" {
    description = "instances for target group Attachment"
    type = list(string)
  
}