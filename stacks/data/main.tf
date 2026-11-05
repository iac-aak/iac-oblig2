# Flyttet til service. Stacken slettes når begge miljøene er migrert.

removed {
  from = module.storage

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.keyvault

  lifecycle {
    destroy = false
  }
}
