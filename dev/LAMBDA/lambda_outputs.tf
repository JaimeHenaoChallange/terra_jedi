################################################################################
# Output Lambda
################################################################################

output "arn_lambda_jedi" {
  description = "Output ARN Lambda jedi"
  value       = aws_lambda_function.jedi_locator.arn
  sensitive   = false
}

################################################################################
# Output KMS
################################################################################
output "arn_key_jedi" {
  description = "ARN de KMS jedi"
  value       = aws_kms_key.jedi_secret_key.arn
}