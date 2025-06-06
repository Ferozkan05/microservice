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
variable "cport" {
  description = "Containerport"
  type        = number
}
variable "iam" {
  description = "ECS iam role"
  type        = string
}

variable "hport" {
  description = "host port"
  type        = number
}
variable "vpc_id" {
  description = "VPC for ecs"
  type        = string
}
variable "subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "sg" {
  description = "SG name"
  type        = string
}
variable "tg" {
  description = "TG name"
  type        = string
}
variable "lg" {
  description = "LG name"
  type        = string
}
