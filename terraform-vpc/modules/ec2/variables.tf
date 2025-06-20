variable "My_Sg_id" {
    description = "sg for ec2"
    type = string
  
}

variable "subnets" {
    description ="subnet for ec2"
    type = list(string)
}
variable "ec2_names" {
    description = "My instances names"
    type = list(string)
    default = ["web-01", "web-02"]
}