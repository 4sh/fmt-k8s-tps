locals {
  cluster_name = "${var.project_name}-${var.environment}-${var.owner}"

  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    Owner       = var.owner
    ManagedBy   = "Terraform"
  }
}
