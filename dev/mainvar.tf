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