locals {
  oidc_issuer = trimprefix(var.cluster_oidc_issuer_url, "https://")
}

resource "aws_iam_role" "ebs_csi_driver" {
  name = "${var.cluster_name}-ebs-csi-driver"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = var.oidc_provider_arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "${local.oidc_issuer}:sub" = "system:serviceaccount:kube-system:ebs-csi-controller-sa"
          "${local.oidc_issuer}:aud" = "sts.amazonaws.com"
        }
      }
    }]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "ebs_csi_driver" {
  role       = aws_iam_role.ebs_csi_driver.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

resource "aws_eks_addon" "coredns" {
  cluster_name                = var.cluster_name
  addon_name                  = "coredns"
  resolve_conflicts_on_update = "PRESERVE"

  configuration_values = jsonencode({
    tolerations = [{ operator = "Exists" }]
  })

  tags = var.tags
}

resource "aws_eks_addon" "ebs_csi_driver" {
  depends_on = [aws_eks_addon.coredns]

  cluster_name                = var.cluster_name
  addon_name                  = "aws-ebs-csi-driver"
  service_account_role_arn    = aws_iam_role.ebs_csi_driver.arn
  resolve_conflicts_on_update = "PRESERVE"

  configuration_values = jsonencode({
    controller = {
      tolerations = [{ operator = "Exists" }]
    }
    node = {
      tolerations = [{ operator = "Exists" }]
    }
  })

  tags = var.tags
}