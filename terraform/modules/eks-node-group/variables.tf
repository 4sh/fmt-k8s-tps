variable "ami_type" {
  description = "AMI type used by the EKS managed node group"
  type        = string
  default     = "AL2023_x86_64_STANDARD"
}

variable "capacity_type" {
  description = "Capacity type for the node group (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"

  validation {
    condition     = contains(["ON_DEMAND", "SPOT"], var.capacity_type)
    error_message = "Capacity type must be ON_DEMAND or SPOT."
  }
}

variable "cluster_name" {
  description = "Name of the EKS cluster the node group is attached to"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the worker nodes"
  type        = string
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "disk_size" {
  description = "Root disk size (in GB) for each worker node"
  type        = number
  default     = 20
}

variable "instance_types" {
  description = "EC2 instance types used by the node group"
  type        = list(string)
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "max_unavailable" {
  description = "Maximum number of nodes unavailable during a rolling update"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "node_group_name" {
  description = "Name of the EKS managed node group"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the worker nodes are deployed"
  type        = list(string)
}

variable "environment" {
  type        = string
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}

