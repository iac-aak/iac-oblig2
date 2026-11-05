# Flyttet til service. Stacken slettes når begge miljøene er migrert.

removed {
  from = module.vm

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.webapp

  lifecycle {
    destroy = false
  }
}
