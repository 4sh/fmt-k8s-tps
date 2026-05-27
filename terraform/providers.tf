provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  assume_role {
    role_arn     = var.assume_role_arn
    session_name = "terraform-${var.project_name}-${var.environment}"
    external_id  = var.assume_role_external_id
  }

  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Project     = var.project_name
      Environment = var.environment
      Owner       = var.owner
    }
  }
}
