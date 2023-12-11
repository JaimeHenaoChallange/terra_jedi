################################################################################
# VPC
################################################################################
resource "aws_vpc" "main" {
  cidr_block           = var.cidrblock
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "vpc-main"]))}" })
}

################################################################################
# Public subnet
################################################################################
resource "aws_subnet" "subnetpublic" {
  count             = length(local.subnetspublic)
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.subnetspublic[count.index]
  availability_zone = local.azs[count.index]
  tags              = merge({ Name = "${join("-", tolist([var.cliente, var.environment, var.subnetspublicnames[count.index]]))}" })
}

################################################################################
# Lambdas Subnet - Lambda
################################################################################
resource "aws_subnet" "subnetlambda" {
  count             = length(local.subnetlambda)
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.subnetlambda[count.index]
  availability_zone = local.azs[count.index]
  tags              = merge({ Name = "${join("-", tolist([var.cliente, var.environment, var.subnetslambdanames[count.index]]))}" })
}
