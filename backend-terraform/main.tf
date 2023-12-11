######################################################################
# Deployment Dynamodb - S3 Backed Terraform
######################################################################

######################################################################
# Bucket S3
######################################################################
resource "aws_s3_bucket" "terraform_tfstate" {
  bucket = join("-", tolist([var.cliente, var.environment, "s3-states"]))

  lifecycle {
    prevent_destroy = "false"
  }

  tags = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "s3-states"]))}" })

}

resource "aws_s3_bucket_public_access_block" "s3_public_access_block" {
  bucket = aws_s3_bucket.terraform_tfstate.id

  block_public_acls   = true
  block_public_policy = true

}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_s3_ssec" {
  bucket = aws_s3_bucket.terraform_tfstate.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.s3-sse-algorithm
    }
  }

}

resource "aws_s3_bucket_versioning" "s3-prg-versioning" {
  bucket = aws_s3_bucket.terraform_tfstate.id
  versioning_configuration {
    status = var.s3-versioning-cfg
  }
}

resource "aws_s3_bucket_logging" "logging-s3" {
  bucket = aws_s3_bucket.terraform_tfstate.id
  target_bucket = aws_s3_bucket.terraform_tfstate.id
  target_prefix = "${var.s3-logging-target-preffix}${var.s3-state-name}"
}

######################################################################
# Table Dynamodb
######################################################################
resource "aws_dynamodb_table" "terraform-locks" {
  name         = join("-", tolist([var.cliente, var.environment, "dynamodb-states"]))
  billing_mode = var.dynamo-billing-mode
  hash_key     = var.dynamo-hash-key
  attribute {
    name = var.dynamo-hash-key
    type = "S"
  }
  lifecycle {
    prevent_destroy = "true"
  }
  point_in_time_recovery {
    enabled = true
  }
}
