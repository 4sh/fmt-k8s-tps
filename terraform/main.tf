data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "./modules/vpc"

  availability_zones   = slice(data.aws_availability_zones.available.names, 0, length(var.private_subnet_cidrs))
  cluster_name         = local.cluster_name
  name                 = local.cluster_name
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  tags                 = local.common_tags
  vpc_cidr             = var.vpc_cidr
}

module "eks" {
  source = "./modules/eks"

  admin_iam_arns  = var.admin_iam_arns
  cluster_name    = local.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = module.vpc.private_subnet_ids
  tags            = local.common_tags
}

module "eks_node_group" {
  source = "./modules/eks-node-group"

  environment     = var.environment
  cluster_name    = module.eks.cluster_name
  cluster_version = var.cluster_version
  desired_size    = var.node_desired_size
  instance_types  = var.node_instance_types
  max_size        = var.node_max_size
  min_size        = var.node_min_size
  node_group_name = "default"
  subnet_ids      = module.vpc.private_subnet_ids
  tags            = local.common_tags

  depends_on = [module.eks]
}

