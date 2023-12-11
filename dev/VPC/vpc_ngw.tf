################################################################################
# Recuros NAT Gateway
################################################################################
resource "aws_nat_gateway" "ngw" {
  depends_on    = [aws_internet_gateway.main]
  subnet_id     = aws_subnet.subnetpublic.0.id
  allocation_id = aws_eip.nat_gateway.id
  tags          = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "ngw-main"]))}" })
}

################################################################################
# Recuros Elastic IP
################################################################################
resource "aws_eip" "nat_gateway" {
  depends_on = [aws_internet_gateway.main]
  domain     = "vpc"
  tags       = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "eip-ngw"]))}" })
}
