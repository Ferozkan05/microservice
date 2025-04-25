variable "task_name" {
  description = "Task name"
  type        = string
}
variable "service_name" {
  description = "Service name"
  type        = string
}
variable "cluster_name" {
  description = "Cluster name"
  type        = string
}
variable "image" {
  description = "ECR Image name"
  type        = string
}


variable "subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "sg" {
  description = "SG name"
  type        = list(string)
}
variable "tg" {
  description = "TG name"
  type        = string
}
variable "elb" {
  description = "ELB name"
  type        = string
}
