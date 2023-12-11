# ###############################################################################
# # Bucket S3 codigo lambda
# ###############################################################################

# resource "aws_s3_bucket" "lambda-bucket-codigo" {
#     bucket = join("-", tolist([var.cliente, var.environment, "s3-bucket-codigo"]))
#     tags   = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "s3-bucket-codigo"]))}" })

#     lifecycle {
#     prevent_destroy = "true"
#     }
# }
# resource "aws_s3_bucket_versioning" "lambda-bucket-codigo" {
#   bucket = aws_s3_bucket.lambda-bucket-codigo.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

###############################################################################
# Configuración de eventos S3 para desencadenar la Lambda al recibir un nuevo Manifiesto
###############################################################################

resource "aws_s3_bucket" "jedi_manifest_bucket" {
  bucket = join("-", tolist([var.cliente, var.environment, "jedi-manifest-bucket"]))
  tags   = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "jedi_manifest_bucket"]))}" })

  lifecycle {
    prevent_destroy = "true"
  }
}

resource "aws_s3_bucket_notification" "jedi_manifest_notification" {
  bucket = aws_s3_bucket.jedi_manifest_bucket.bucket

  lambda_function {
    lambda_function_arn = aws_lambda_function.jedi_locator.arn
    events              = ["s3:ObjectCreated:*"]
  }
}
