variable "instance_types" {
  description = "List of instance types"
  type        = list(string)
  default     = ["t2.micro", "t3.small", "t3.medium", "m5.large"]
}

variable "instance_type_index" {
  description = "Index of instance type"
  type        = number
  default     = 0
}


variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  # default = []
  # default = ["10.0.1.0/24"]
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  # default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = []
  # default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "private_subnet_cidrs_storage" {
  type        = list(string)
  description = "Private Subnet CIDR values for storage"
  default     = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
