# This file contains the variable values used by the Terraform code

region                  = "us-east-1"
aws_profile             = "<profile_name>"
vpc_name                = "main-vpc"
vpc_cidr                = "10.0.0.0/16"
azs                     = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs    = ["10.0.101.0/24", "10.0.102.0/24"]
enable_nat_gateway      = true
single_nat_gateway      = true
enable_dns_hostnames    = true
enable_dns_support      = true
map_public_ip_on_launch = true

cluster_name                   = "dev-cluster"
cluster_version                = "1.31"
enable_irsa                    = true
cluster_endpoint_public_access = true
eks_admin_user_arn             = "arn:aws:iam::<account_id>:user/<account_name>"
node_desired_size              = 1
node_max_size                  = 1
node_min_size                  = 1
node_instance_type             = "t3.small"

common_tags = {
  Environment = "dev"
}
