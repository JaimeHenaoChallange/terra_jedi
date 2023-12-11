################################################################################
# Recurso Route Table - Subnet Public
################################################################################
resource "aws_route_table" "rtpublic" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "rtb-public"]))}" })
}

resource "aws_route_table_association" "rutas_public" {
  count          = length(local.subnetspublic)
  subnet_id      = element(aws_subnet.subnetpublic.*.id, count.index)
  route_table_id = aws_route_table.rtpublic.id
}


################################################################################
# Recurso Route Table - Subnets Lambdas
################################################################################

resource "aws_route_table" "rtlambda" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
  tags = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "rtb-lambdas"]))}" })
}

resource "aws_route_table_association" "rutas_lambdas" {
  count          = length(local.subnetlambda)
  subnet_id      = element(aws_subnet.subnetlambda.*.id, count.index)
  route_table_id = aws_route_table.rtlambda.id
}