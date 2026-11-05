output "resource_group_name" {
  description = "Ressursgruppa alle stackene bruker. Eies nå av shared-network."
  value       = local.rg_name
}

output "location" {
  description = "Regionen alt står i."
  value       = var.location
}

output "vnet_name" {
  description = "Navnet på VNet-et. Eies nå av shared-network."
  value       = local.vnet_name
}

output "subnet_ids" {
  description = "Subnett-ID per tjeneste."
  value       = { for navn, s in module.subnet : navn => s.subnet_id }
}
