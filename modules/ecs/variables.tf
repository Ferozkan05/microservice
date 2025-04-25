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
variable "hport" {
  description = "host port"
  type        = number
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
variable "lg" {
  description = "LG name"
  type        = string
}
