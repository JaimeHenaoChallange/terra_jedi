######################################################################
# Variable Provider
######################################################################

variable "aws_region" {
  default = "us-east-1"
}

variable "profile" {
  default = "kantox"
}

######################################################################
# Variable Globales
######################################################################

variable "cliente" {
  description = "Nombre del cliente"
  type        = string
  default     = "kantox"
  validation {
    condition     = contains(["kantox"], var.cliente)
    error_message = "El cliente seleccionado no esta permitido, por favor ingresa el cliente correcto"
  }
  nullable = false
}

variable "environment" {
  description = "Ambiente donde será desplegado el componente. Sus únicos valores posibles serán: dev, qa, pdn."
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "qa", "pdn", "drp"], var.environment)
    error_message = "El ambiente seleccionado no es valido, solo esta permitido: dev, qa, pdn, drp, acepta."
  }
  nullable = false
}

locals {
  tags = {
    environment  = "dev"
    project-name = "Kantox-Challenge"
    owner        = "Kantox-dev-Jaime"
    area         = "cloud"
    provisioned  = "terraform"
  }
}

######################################################################
# Variable Main - Recursos
######################################################################

######################################################################
# Variable S3
######################################################################
variable "s3-state-name" {
  description = "Variable nombre bucket S3 State Terraform"
  default     = "tfstate"
}

variable "s3-logging-target-preffix" {
  description = "Default value of target prefix to logging"
  type        = string
  default     = "log/"
}

variable "s3-prevent-destroy" {
  description = "Default value to keep or destroy a bucket"
  type        = bool
  default     = true
}


variable "s3-restrict-public-buckets" {
  description = "Restrict public buckets"
  type        = bool
  default     = true
}

variable "s3-block-public-acls" {
  description = "Block public acls bucket"
  type        = bool
  default     = true
}
variable "s3-block-public-policy" {
  description = "Block public policy"
  type        = bool
  default     = true
}
variable "s3-ignore-public-acls" {
  description = "Ignore public acls"
  type        = bool
  default     = true
}

variable "s3-sse-algorithm" {
  description = "Default value of sse algorithm"
  type        = string
  default     = "AES256"
}

variable "s3-versioning-cfg" {
  description = "Default value Enable"
  type        = string
  default     = "Enabled"
}
######################################################################
# Variable Dynamodb
######################################################################
variable "dynamo-table-name" {
  description = "Default name for dynamo table to store lock status"
  type        = string
  default     = "tflocks"
}

variable "dynamo-billing-mode" {
  description = "Billing mode for dynamo table"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "dynamo-hash-key" {
  description = "Default hash key for dynamo table"
  type        = string
  default     = "LockID"
}

variable "dynamo-server-side-encryption" {
  description = "Dynamo server side encryption by default"
  type        = bool
  default     = true
}
