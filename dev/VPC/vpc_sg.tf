################################################################################
# Security Group Lambdas
################################################################################

resource "aws_security_group" "lambda_jedi" {
  name = join("-", tolist([var.cliente, var.environment, "sg-lambda_jedi"]))

  description = "Security Group Lambda_jedi"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = ""
    from_port       = 443
    protocol        = "tcp"
    security_groups = []
    self            = true
    to_port         = 443
  }

  egress {
    cidr_blocks     = ["0.0.0.0/0"]
    from_port       = 0
    protocol        = "-1"
    security_groups = []
    to_port         = 0
  }

  tags = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "sg-lambda_jedi"]))}" })
}