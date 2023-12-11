######################################################################
# Variable Globales / Comunes
######################################################################
variable "cliente" {}
variable "environment" {}
variable "aws_region" {}

# ######################################################################
# # Variable VPC
# ######################################################################
variable "cidrblock" {
  default = "10.10.0.0/16"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

# ######################################################################
# # Variable SubNet Dev
# ######################################################################

variable "subnetspublicnames" {
  description = "Subnets Public"
  type        = list(string)
  default     = ["pub01", "pub02"]
}

variable "subnetslambdanames" {
  description = "Subnets Lambdas"
  type        = list(string)
  default     = ["lambda-01", "lambda-02"]
}


locals {

  subnetspublic = [
    local.publicblock01,
    local.publicblock02
  ]

  subnetlambda = [
    local.lambdablock01,
    local.lambdablock02
  ]

  publicblock01 = cidrsubnet(var.cidrblock, 8, 1)
  publicblock02 = cidrsubnet(var.cidrblock, 8, 2)
  lambdablock01 = cidrsubnet(var.cidrblock, 8, 3)
  lambdablock02 = cidrsubnet(var.cidrblock, 8, 4)


  # Zona de disopnibilidad (AZ)
  azs = ["${var.aws_region}a", "${var.aws_region}b"]

  #   #Nombres Subnet por servicios
  subnetspublicnames = var.subnetspublicnames
  subnetslambdanames = var.subnetslambdanames
}

