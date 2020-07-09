# Terraform AWS Development Container

This is a simple Docker container that allows portable use of Terraform on AWS for accounts that have been bootstrapped
with [terraform-aws-bootstrap](https://github.com/vexingcodes/terraform-aws-bootstrap). It contains the AWS CLI,
Terraform, and [tfconfig](https://github.com/vexingcodes/terraform-aws-tfconfig).

The `src` directory contains an example invocation of the bootstrap module.

This repository is a template. You should fork it and replace the contents of `src` with whatever you'd like to deploy.

# Usage

For example, to bootstrap an account first modify `src/bootstrap.tf` to contain the `s3_bucket` value that you actually
want. You can also modify `src/.tfconfig` to change the blob name in S3, but that's not required. Then run `./dev` from
the repository root to enter the Docker development environment. Once in the container, you can use `aws configure` to
configure your AWS credentials. After that you can run `terraform init` and then `terraform apply` to apply the initial
bootstrapping resources. Once the bootstrapping resources have been applied, you can run `tfconfig` to create
`config.tf` (never check this into source control) which contains information necessary to store AWS state in S3. Once
`config.tf` exists, run `terraform init` again. It will prompt you to upload the state file to S3. Once the state is in
S3 you can run `terraform plan` and see that no changes are suggested. At this point you may want to also use Terraform
to create developer IAM users, so that you can delete the root credentials that were used during bootstrapping.
