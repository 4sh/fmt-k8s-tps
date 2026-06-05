output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = aws_eks_cluster.main.arn
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "Endpoint URL for the EKS Kubernetes API server"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "cluster_oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster"
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

output "cluster_security_group_id" {
  description = "ID of the security group attached to the EKS control plane"
  value       = aws_security_group.cluster.id
}

output "oidc_provider_arn" {
  description = "ARN of the IAM OIDC provider used for IRSA"
  value       = aws_iam_openid_connect_provider.cluster.arn
}

output "ebs_csi_driver_role_arn" {
  description = "ARN of the IAM role used by the EBS CSI driver via IRSA"
  value       = aws_iam_role.ebs_csi_driver.arn
}

