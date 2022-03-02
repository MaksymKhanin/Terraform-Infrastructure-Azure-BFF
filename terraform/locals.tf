locals{

  naming   = lookup(local.naming_map, var.subscription_type)
  specific = lookup(local.specific_map, var.subscription_type)

  saas_digits = ""
  location    = ""

  naming_map = {

    build = {
      main_resource_group_name = ""
      plan_name                = ""
      app_1_name               = ""
    }

    inte = {
      main_resource_group_name = ""
      plan_name                = ""
      app_1_name               = ""
    }

    prod = {
      main_resource_group_name = ""
      plan_name                = ""
      app_1_name               = "" 
    }
  }

  specific_map = {
    build = {
      subscription_id = ""
      apim = {
        subscription_id     = ""
        resource_group_name = ""
        name                = ""
        api_name            = "bffTemplate-${var.environment_name}"
      }
      tags = {}
    }

    inte = {
      subscription_id = ""
      apim = {
        subscription_id     = ""
        resource_group_name = ""
        name                = ""
        api_name            = "bffTemplate-${var.environment_name}"
      }
      tags = {
        CostCenter = ""
      }
    }

    prod = {
      subscription_id = ""
      tags = {
        CostCenter = ""
      }
    }
  }

    app_config_labels = {
    helper   = "helper"
    shared   = "shared"
  }

  default_tags = merge(local.specific.tags, {
    managed_by  = "terraform"
    stream      = "bffTemplate"
    component   = "template"
    environment = var.environment_name
  })

}