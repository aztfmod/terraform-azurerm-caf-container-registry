module "caf_name_acr" {
  source  = "aztfmod/caf-naming/azurerm"
  version = "~> 0.1.0"

  name    = var.name
  type    = "acr"
  convention  = var.convention
}

resource "azurerm_container_registry" "acr" {
  name                      = module.caf_name_acr.acr
  resource_group_name       = var.rg
  location                  = var.location
  sku                       = var.sku
  admin_enabled             = var.admin_enabled
  georeplication_locations  = var.georeplication_locations
  tags                      = local.tags
}