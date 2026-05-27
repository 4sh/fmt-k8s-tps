variable "availability_zones" {
  description = "List of availability zones used for the subnets"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster, used to tag subnets for Kubernetes integration"
  type        = string
}

variable "name" {
  description = "Name prefix applied to all VPC resources"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets (one per AZ)"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets (one per AZ)"
  type        = list(string)
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

