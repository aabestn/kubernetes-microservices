variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS deployment region"
}

variable "cluster_name" {
  type        = string
  default     = "k8s-engine-cluster"
  description = "EKS Cluster Name"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}

variable "instance_type" {
  type        = string
  default     = "t3.medium"
  description = "Node Group EC2 instance size"
}

variable "desired_capacity" {
  type        = number
  default     = 3
  description = "Initial node pool scale"
}

variable "min_capacity" {
  type        = number
  default     = 1
}

variable "max_capacity" {
  type        = number
  default     = 5
}