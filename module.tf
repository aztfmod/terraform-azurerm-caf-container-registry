resource "azurecaf_naming_convention" "caf_name_acr" {  
  name          = var.name
  prefix        = var.prefix != "" ? var.prefix : null
  postfix       = var.postfix != "" ? var.postfix : null
  max_length    = var.max_length != "" ? var.max_length : null
  resource_type = "acr"
  convention    = var.convention
}

resource "azurerm_container_registry" "acr" {
  name                      = azurecaf_naming_convention.caf_name_acr.result
  resource_group_name       = var.resource_group_name
  location                  = var.location
  sku                       = var.sku
  admin_enabled             = var.admin_enabled
  georeplication_locations  = var.georeplication_locations
  tags                      = local.tags
}