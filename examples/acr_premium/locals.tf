locals {
    convention = "cafclassic"
    name = "caftestacrdeploy"
    location = "southeastasia"
    prefix = ""
    resource_groups = {
        test = { 
            name     = "test-caf-acr"
            location = "southeastasia" 
        },
    }
    tags = {
        environment     = "DEV"
        owner           = "CAF"
    }
    solution_plan_map = {
        NetworkMonitoring = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/NetworkMonitoring"
        },
    }
    enable_event_hub = false

    sku = "Premium"
    georeplication_locations = ["eastasia", "eastus2"]
    admin_enabled = true
    diagnostics = {
            log = [
                    # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                    ["ContainerRegistryRepositoryEvents", true, true, 60],
                    ["ContainerRegistryLoginEvents", true, true, 60],

            ]
            metric = [
                    #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]                 
                    ["AllMetrics", true, true, 60],
            ]   
    }
}