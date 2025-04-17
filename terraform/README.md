# EKS - Terraform

This Terraform project uses public modules from the Terraform Registry to create a minimal managed node Kubernetes cluster on AWS. It leverages the following modules:

- [terraform-aws-modules/vpc/aws](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
- [terraform-aws-modules/eks/aws](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)

## Infrastructure Details
The directory structure looks like below,

```
devops-challenge-senior/
├── app/
│   └── simple-time-service.yaml
└── terraform/
    ├── main.tf
    ├── provider.tf
    ├── variables.tf
    ├── output.tf
    └── terraform.tfvars
```

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
  ```

- **Configure AWS Authentication**

  This project uses AWS CLI profiles for authentication. **Avoid using root credentials.**

  **Steps:**
  1. Create an IAM user with **admin privileges** in your AWS account.
  2. Generate **Access Key** and **Secret Access Key** for that user.
  3. Configure your AWS CLI profile:

     ```bash
     aws configure --profile <your-profile-name>
     ```

  **Update the following in `terraform.tfvars`:**
  - `aws_profile`: Set it to the AWS CLI profile name you just configured.
  - `eks_admin_user_arn`: Replace it with the full ARN of the IAM user you created.

  > 💡 Make sure to replace the Account ID and IAM username in the ARN appropriately.


- **Deploy the Infrastructure**

  **Initialize Terraform:**
  ```bash
  terraform init
  ```

  **Format and validate the configuration:**
  ```bash
  terraform fmt
  terraform validate
  ```

  **Review the execution plan:**
  ```bash
  terraform plan
  ```

  **Apply the configuration to create resources:**
  ```bash
  terraform apply -auto-approve
  ```

## Notes

1. A `null_resource` is used in `main.tf` to meet the requirement that, after running `terraform apply`, the application should be accessible via a Load Balancer DNS.
2. If the Load Balancer DNS does not respond immediately, wait a few seconds and try again.
3. The Load Balancer is not directly provisioned by Terraform — it is dynamically created by Kubernetes when a `Service` of type `LoadBalancer` is applied.
4. Before destroying the infrastructure, clean up the Kubernetes resources manually:
   ```bash
   kubectl delete -f ../app/simple-time-service.yaml
   ```
5. Once the Kubernetes resources are deleted, the Load Balancer will be automatically removed.
6. Finally, destroy the entire infrastructure:
   ```bash
   terraform destroy -auto-approve
   ```
