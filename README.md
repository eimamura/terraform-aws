# terraform-aws

This repository contains a collection of software architecture diagrams that I have created while working on various projects.

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

