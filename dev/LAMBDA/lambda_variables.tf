######################################################################
# Variable Globales / Comunes / Modules Dev
######################################################################
variable "cliente" {}
variable "environment" {}
variable "aws_region" {}
variable "sublambda_sgr" {}
variable "sublambda" {}

######################################################################
# Variable Bucket S3
######################################################################
variable "s3-logging-target-preffix" {
  description = "Default value of target prefix to logging"
  type        = string
  default     = "log/"
}

# ######################################################################
# # Variable Lambda jedi
# ######################################################################
# variable "s3_jedi" {
#     description = "Archivo S3"
#     default     = "lambda_function.zip"
# }