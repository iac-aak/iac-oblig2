# Det tjenestene faktisk deler: ressursgruppa og VNet-et. Subnettene eies av
# service-stacken, én instans per tjeneste.

locals {
  rg_name   = "rg-${var.kortnavn}-oblig2-${var.miljo}"
  vnet_name = "vnet-${var.kortnavn}-${var.miljo}"

  tags = {
    eier  = var.kortnavn
    miljo = var.miljo
    kurs  = "dcst3005-oblig2"
  }
}

resource "azurerm_resource_group" "this" {
  name     = local.rg_name
  location = var.location
  tags     = local.tags
}

module "vnet" {
  source              = "../../modules/vnet"
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = var.address_space
  tags                = local.tags
}

# -----------------------------------------------------------------------------
#  Migrering: ta over ressursgruppa og VNet-et fra network-stacken.
#  ID-ene bygges fra abonnementet Terraform er logget inn i, så ingen
#  abonnements-ID står i koden (K5). Fjernes når begge miljøene er migrert (K8).
# -----------------------------------------------------------------------------

data "azurerm_subscription" "current" {}

import {
  to = azurerm_resource_group.this
  id = "${data.azurerm_subscription.current.id}/resourceGroups/${local.rg_name}"
}

import {
  to = module.vnet.azurerm_virtual_network.this
  id = "${data.azurerm_subscription.current.id}/resourceGroups/${local.rg_name}/providers/Microsoft.Network/virtualNetworks/${local.vnet_name}"
}
