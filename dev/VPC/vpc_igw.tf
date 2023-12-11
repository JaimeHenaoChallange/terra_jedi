################################################################################
# Internet Gateway  / Validar si se debe eliminar
################################################################################
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "igw-main"]))}" })
}
