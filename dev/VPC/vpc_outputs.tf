# ##########################################################################
# # Output Security Group - Lambdas
# ##########################################################################

output "sublambda_sgr" {
  description = "SubNet Lambdas ID"
  value       = aws_security_group.lambda_jedi.id
}

##########################################################################
# Output SubNet - Lambda
##########################################################################
output "sublambda" {
  description = "SubNet Lambdas ID"
  value       = aws_subnet.subnetlambda.*.id
}










# ##########################################################################
# # Output Security Group - Lambda - api_orderin
# ##########################################################################
# output "lambdasgr-api_orderin" {
#   value = aws_security_group.lambda-api_orderin.id
# }

# ##########################################################################
# # Output Security Group - Lambda - api_orderstatus
# ##########################################################################
# output "lambdasgr-api_orderstatus" {
#   value = aws_security_group.lambda-api_orderstatus.id
# }

# ##########################################################################
# # Output Security Group - Lambda - api_datainventory
# ##########################################################################
# output "lambdasgr-api_datainventory" {
#   value = aws_security_group.lambda-api_datainventory.id
# }

# ##########################################################################
# # Output Security Group - Lambda - api_dataprice
# ##########################################################################
# output "lambdasgr-api_dataprice" {
#   value = aws_security_group.lambda-api_dataprice.id
# }

# ##########################################################################
# # Output Security Group - Lambda - api_dataprice
# ##########################################################################
# output "lambdasgr-api_datamaster" {
#   value = aws_security_group.lambda-api_datamaster.id
# }

# ##########################################################################
# # Output SubNet - Lambda - sap subnet
# ##########################################################################
# output "sublambdasap" {
#   description = "SubNet Lambdas ID"
#   value       = aws_subnet.subnetlambdasap.*.id
# }

# ##########################################################################
# # Output Security Group - Lambda - sap_orderstatus
# ##########################################################################
# output "lambdasgr-sap_orderstatus" {
#   value = aws_security_group.lambda-sap_orderstatus.id
# }

# ##########################################################################
# # Output Security Group - Lambda - sap_order
# ##########################################################################
# output "lambdasgr-sap_order" {
#   value = aws_security_group.lambda-sap_order.id
# }

# ##########################################################################
# # Output Security Group - Lambda - sap_inventoryupdate
# ##########################################################################
# output "lambdasgr-sap_inventoryupdate" {
#   value = aws_security_group.lambda-sap_inventoryupdate.id
# }

# ##########################################################################
# # Output Security Group - Lambda - sap_datamasterinventory
# ##########################################################################
# output "lambdasgr-sap_datamasterinventory" {
#   value = aws_security_group.lambda-sap_datamasterinventory.id
# }

# ##########################################################################
# # Output SubNet - Lambda - vtex subnet
# ##########################################################################
# output "subnetlambdavtex" {
#   description = "SubNet Lambdas ID"
#   value       = aws_subnet.subnetlambdavtex.*.id
# }

# ##########################################################################
# # Output Security Group - Lambda - vtex_priceupdate
# ##########################################################################
# output "lambdasgr-vtex_priceupdate" {
#   value = aws_security_group.lambda-vtex_priceupdate.id
# }

# ##########################################################################
# # Output Security Group - Lambda - vtex_detailorder
# ##########################################################################
# output "lambdasgr-vtex_detailorder" {
#   value = aws_security_group.lambda-vtex_detailorder.id
# }

# ##########################################################################
# # Output Security Group - Lambda - vtex_returns
# ##########################################################################
# output "lambdasgr-vtex_returns" {
#   value = aws_security_group.lambda-vtex_returns.id
# }









