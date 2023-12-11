#######################################################
# Lambda JEDI
#######################################################
resource "aws_lambda_function" "jedi_locator" {
  function_name    = join("-", tolist([var.cliente, var.environment, "jedi_locator"]))
  # s3_bucket        = aws_s3_bucket.lambda-bucket-codigo.id
  # s3_key           = var.s3_jedi
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  handler          = "index.handler"
  runtime          = "nodejs16.x"
  memory_size      = "512"
  timeout          = "30"
  role             = aws_iam_role.lambda-jedi.arn

  environment {
    variables = {
      KMS_KEY_ID = aws_kms_key.jedi_secret_key.arn
    }
  }

  vpc_config {
    security_group_ids = [var.sublambda_sgr]
    subnet_ids         = ["${var.sublambda[0]}"]
  }
  depends_on = [
    aws_kms_key.jedi_secret_key,
  ]

  tags = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "jedi_locator"]))}" })
}

resource "aws_lambda_permission" "allow_s3_invoke" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.jedi_locator.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.jedi_manifest_bucket.arn
}