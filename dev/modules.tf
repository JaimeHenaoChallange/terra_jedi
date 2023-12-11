######################################################################
# Module VPC
######################################################################
module "VPC" {
  source      = "./VPC"
  cliente     = var.cliente
  environment = var.environment
  aws_region  = var.aws_region
}

######################################################################
# Module LAMBDA
######################################################################
module "LAMBDA" {
  source        = "./LAMBDA"
  cliente       = var.cliente
  environment   = var.environment
  aws_region    = var.aws_region
  sublambda_sgr = module.VPC.sublambda_sgr
  sublambda     = module.VPC.sublambda
}





