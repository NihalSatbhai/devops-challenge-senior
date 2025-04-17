# EKS - Terraform

This Terraform project uses public modules from the Terraform Registry to create a minimal managed node Kubernetes cluster on AWS. It leverages the following modules:

- [terraform-aws-modules/vpc/aws](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
- [terraform-aws-modules/eks/aws](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)

## Infrastructure Details
The directory structure looks like below,

devops-challenge-senior/
├── app/
│   └── simple-time-service.yaml
└── terraform/
    ├── main.tf
    ├── provider.tf
    ├── variables.tf
    ├── output.tf
    └── terraform.tfvars

## Prerequisites
- **[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)**
- **[Terraform](https://developer.hashicorp.com/terraform/install)**
- **[Kubectl](https://kubernetes.io/docs/tasks/tools/)**

## Getting Started
Follow these steps to deploy the infrastructure:

- **Clone the Repository**
  ```bash
  git clone https://github.com/NihalSatbhai/devops-challenge-senior.git
  cd devops-challenge-senior/terraform/

- **Configure AWS Authentication**
  We use AWS CLI profiles for authentication. Avoid using root credentials.
  1. Create an IAM user with admin privileges in your AWS account.
  2. Generate an access key and secret key for the user.
  3. Configure the AWS CLI profile:
  ```bash
  aws configure --profile <profile-name>
  
  Update the following values in `terraform.tfvars`:
  - `aws_profile`: Your AWS CLI profile name
  - `eks_admin_user_arn`: The ARN of the IAM user you created
  Make sure you replace the Account ID and IAM username accordingly.

- **Deploy the Infrastructure**
  Intialize Terraform:
  ```bash
  terraform init

  Format and validate the code:
  ```bash
  terraform fmt
  terraform validate

  Review the plan:
  ```bash
  terraform plan

  Apply the configuration:
  ```bash
  terraform apply -auto-approve

## Notes

1. A `null_resource` is used in `main.tf` to satisfy the requirement that after running terraform apply, the application should be accessible via a Load Balancer DNS.
2. If the Load Balancer DNS doesn’t respond immediately, wait a few seconds and retry.
3. The Load Balancer is dynamically created by Kubernetes when the `Service` of type `LoadBalancer` is applied it's not directly provisioned by Terraform.
4. Before destroying the infrastructure, clean up the Kubernetes resources by running:
```bash
kubectl delete -f ../app/simple-time-service.yaml

5. Once the resources are deleted, the Load Balancer will be removed automatically.
6. Finally, destroy the entire infrastructure:
```bash
terraform destroy -auto-approve
