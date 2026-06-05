variable "aws_region" {
  description = "AWS region where the EKS cluster will be deployed"
  type        = string
  default     = "eu-west-3"
}

variable "aws_profile" {
  description = "Local AWS CLI profile used as the source of credentials before assuming the deployment role. Leave null to fall back to the default credential chain (env vars, SSO, instance profile...)."
  type        = string
  default     = null
}

variable "assume_role_arn" {
  description = "ARN of the IAM role assumed by Terraform to deploy resources. Each user/environment has its own role."
  type        = string
}

variable "assume_role_external_id" {
  description = "Optional external ID required by the trust policy of the assumed role."
  type        = string
  default     = null
  sensitive   = true
}

variable "owner" {
  description = "Owner of the cluster (user identifier, team, email). Used for tagging and traceability."
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS control plane"
  type        = string
  default     = "1.30"
}

variable "environment" {
  description = "Target deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "node_desired_size" {
  description = "Desired number of worker nodes in the default managed node group"
  type        = number
  default     = 2
}

variable "node_instance_types" {
  description = "EC2 instance types used by the default managed node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_max_size" {
  description = "Maximum number of worker nodes in the default managed node group"
  type        = number
  default     = 3
}

variable "node_min_size" {
  description = "Minimum number of worker nodes in the default managed node group"
  type        = number
  default     = 1
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets (one per AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "project_name" {
  description = "Project name used as a prefix for resource naming"
  type        = string
  default     = "fmt-k8s-tps"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets (one per AZ)"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "admin_iam_arns" {
  description = "List of IAM principal ARNs (users or roles) granted cluster-admin access via EKS access entries"
  type        = list(string)
  default     = []
}
