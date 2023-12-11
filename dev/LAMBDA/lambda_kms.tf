########################################################################
# Crear una clave KMS para encriptar y desencriptar la información Jedi
########################################################################

resource "aws_kms_key" "jedi_secret_key" {
  description = "CMK para encriptar y desencriptar secretos Jedi"
  enable_key_rotation = true
}

resource "aws_kms_alias" "jedi_secret_alias" {
  name          = "alias/jedi-secret"
  target_key_id = aws_kms_key.jedi_secret_key.key_id
}

resource "aws_kms_key_policy" "jedi_secret" {
  key_id = aws_kms_key.jedi_secret_key.key_id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "kms:Decrypt",
        Resource = "*"
      },
      {
        Effect = "Allow",
        Principal = {
          Service = "kms.amazonaws.com"
        },
        Action = [
          "kms:PutKeyPolicy",
          "kms:CreateGrant",
          "kms:ListGrants",
          "kms:RevokeGrant",
          "kms:encrypt",
        ],
        Resource = "*"
      }
    ]
  })
}


