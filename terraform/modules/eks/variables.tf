variable "cluster_enabled_log_types" {
  description = "List of EKS control plane log types to enable in CloudWatch"
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "cluster_log_retention_days" {
  description = "Retention period (in days) for the EKS control plane log group"
  type        = number
  default     = 30
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS control plane"
  type        = string
}

variable "endpoint_private_access" {
  description = "Whether the EKS API server is accessible from inside the VPC"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Whether the EKS API server is accessible from the public internet"
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "CIDR blocks allowed to access the public EKS API endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "subnet_ids" {
  description = "List of subnet IDs where the EKS control plane ENIs are deployed"
  type        = list(string)
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "admin_iam_arns" {
  description = "List of IAM principal ARNs granted cluster-admin access via EKS access entries"
  type        = list(string)
  default     = []
}

