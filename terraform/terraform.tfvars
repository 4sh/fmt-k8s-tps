owner        = "$ME"

assume_role_arn = "arn:aws:iam::308759948315:role/$ME"
admin_iam_arns = ["arn:aws:iam::308759948315:user/$ME"]
assume_role_external_id = "shared-secret-$ME"

node_instance_types = ["t3.medium"]
node_desired_size   = 1
node_min_size       = 1
node_max_size       = 2