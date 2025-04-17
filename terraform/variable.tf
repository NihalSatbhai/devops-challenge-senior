# Defines all the input variables required by the Terraform configuration

variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile name to use"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to create NAT Gateway"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Create only a single NAT Gateway across all AZs"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
}

variable "map_public_ip_on_launch" {
  description = "Assign public IPs to instances launched in public subnets"
  type        = bool
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
}

variable "enable_irsa" {
  description = "Enable IAM Roles for Service Accounts (IRSA)"
  type        = bool
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to the EKS cluster API endpoint"
  type        = bool
}

variable "eks_admin_user_arn" {
  description = "IAM user or role ARN to grant admin access to the EKS cluster"
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of nodes in the EKS node group"
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of nodes in the EKS node group"
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of nodes in the EKS node group"
  type        = number
}

variable "node_instance_type" {
  description = "EC2 instance type for the EKS worker nodes"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
