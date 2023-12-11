########################################################
# Role Lambda
########################################################

############## Role IAM Lambda #######################
resource "aws_iam_role" "lambda-jedi" {
  name               = join("-", tolist(["iamrole", var.cliente, var.environment, "lambda-jedi"]))
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "lambda.amazonaws.com"
        },
    "Effect": "Allow",
    "Sid": ""
    }
    ]
}
EOF
}

################## Policy IAM Lambda #####################
resource "aws_iam_policy" "lambda-jedi" {
  name = join("-", tolist(["iamplcy", var.cliente, var.environment, "lambda-jedi"]))
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:GetObject",
            "s3:PutObject",
            "s3:ListBucket",
            "kms:Encrypt",
            "kms:Decrypt"
          ],
          "Resource" : [
            "arn:aws:s3:::${aws_s3_bucket.jedi_manifest_bucket.bucket}/*",
            "arn:aws:s3:::${aws_s3_bucket.jedi_manifest_bucket.bucket}",
            "arn:aws:kms:us-east-1:423746035755:key/371a478c-6bc5-4d03-98ba-688163e72472",
            "arn:aws:kms:us-east-1:423746035755:key/371a478c-6bc5-4d03-98ba-688163e72472/*"
          ]
        }
      ]
  })
}

################# Attachent Police ###################
resource "aws_iam_role_policy_attachment" "lambda_policy-jedi" {
  for_each = toset([
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  ])
  role       = aws_iam_role.lambda-jedi.name
  policy_arn = each.value
}

resource "aws_iam_role_policy_attachment" "role-attachment_lambda_policy-jedi" {
  role       = aws_iam_role.lambda-jedi.name
  policy_arn = aws_iam_policy.lambda-jedi.arn
}