provider "azurerm" {
   features {}
}

resource "azurerm_resource_group" "rg_test" {
  name     = local.resource_groups.test.name
  location = local.resource_groups.test.location
  tags     = local.tags
}

module "la_test" {
  source  = "aztfmod/caf-log-analytics/azurerm"
  version = "2.0.1"
  
    convention          = local.convention
    location            = local.location
    name                = local.name
    solution_plan_map   = local.solution_plan_map 
    prefix              = local.prefix
    resource_group_name = azurerm_resource_group.rg_test.name
    tags                = local.tags
}

module "diags_test" {
  source  = "aztfmod/caf-diagnostics-logging/azurerm"
  version = "2.0.1"

  convention            = local.convention
  name                  = local.name
  resource_group_name   = azurerm_resource_group.rg_test.name
  prefix                = local.prefix
  location              = local.location
  tags                  = local.tags
  enable_event_hub      = local.enable_event_hub
}

module "acr_test" {
  source = "../../"
  
  prefix                      = local.prefix
  convention                  = local.convention
  name                        = local.name
  resource_group_name         = azurerm_resource_group.rg_test.name
  location                    = local.location 
  tags                        = local.tags
  la_workspace_id             = module.la_test.id
  diagnostics_map             = module.diags_test.diagnostics_map
  diagnostics_settings        = local.diagnostics

  admin_enabled               = local.admin_enabled
  sku                         = local.sku
  georeplication_locations    = local.georeplication_locations
}

