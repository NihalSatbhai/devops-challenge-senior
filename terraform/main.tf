module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnet_cidrs
  private_subnets = var.private_subnet_cidrs

  enable_nat_gateway      = var.enable_nat_gateway
  single_nat_gateway      = var.single_nat_gateway
  enable_dns_hostnames    = var.enable_dns_hostnames
  enable_dns_support      = var.enable_dns_support
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = var.common_tags
}


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.35.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  enable_irsa                    = var.enable_irsa
  cluster_endpoint_public_access = var.cluster_endpoint_public_access

  cluster_timeouts = {
    create = "30m"
    delete = "30m"
  }

  access_entries = {
    nihal-user = {
      principal_arn = var.eks_admin_user_arn
      type          = "STANDARD"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  eks_managed_node_groups = {
    default = {
      desired_size = var.node_desired_size
      max_size     = var.node_max_size
      min_size     = var.node_min_size

      instance_types = [var.node_instance_type]
    }
  }

  tags = var.common_tags
}
