# terraform-aws

This repository contains a collection of software architecture diagrams that I have created while working on various projects.

steps:
- Create IAM User
- Create credencials for codecommit IAM User

- Create codecommit
- Git clone from codecommit
- Setup git credencial manager
- Git push

- Create ECR
- Create CodeBuild, add ECR full access policy to CodeBuildRole
- Run CodeBuild

- Create CodePipeline

- issue codecommit kms
- issue CodePipeline cannot access s3 artefact

# Commands

```bash
aws configure
aws configure list
aws iam get-user
aws iam list-users
```

```bash
terraform apply
terraform destroy
terraform apply -auto-approve
terraform destroy -auto-approve
terraform output my-vm-public-ip
terraform console
```

```bash
ssh -i ec2_public_keypair.pem ec2-user@xxx.xxx.xxx.xxx
ping xxx.xxx.xxx.xxx

scp -i ec2_public_keypair.pem ec2_public_keypair.pem ec2-user@xxx.xxx.xxx.xxx:~/
chmod 400 ec2_public_keypair.pem
```

```bash
sudo amazon-linux-extras install nginx1
sudo systemctl start nginx.service
sudo systemctl enable nginx
systemctl status nginx
```

```bash
find terraform/.terraform*
find terraform/.terraform* -exec rm -rf {} +

find terraform/terraform.tfstate*
find terraform/terraform.tfstate* -exec rm -rf {} +
```

```bash
# install aws cli and create symlink in wsl2 to use host machine .aws
sudo apt update
sudo apt install awscli -y
ln -s /mnt/c/Users/YourUsername/.aws ~/.aws
aws sts get-caller-identity
```