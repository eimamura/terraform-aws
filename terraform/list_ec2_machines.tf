# data "aws_ami" "ubuntu_latest" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical account ID for Ubuntu AMIs
# }

# output "latest_ubuntu_ami_id" {
#   value = data.aws_ami.ubuntu_latest.id
# }

# data "aws_ami" "amazon_linux" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["amazon"]
# }

# output "latest_amazon_linux_ami_id" {
#   value = data.aws_ami.amazon_linux.id
# }



# data "aws_ami" "windows_latest" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["Windows_Server-2019-English-Full-Base-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["amazon"] # AWS-owned Windows Server AMIs
# }

# output "latest_windows_ami_id" {
#   value = data.aws_ami.windows_latest.id
# }
