output "vm_names_uppercase" {
  value       = [for name in azurerm_virtual_machine.main[*].name : upper(name)]
  description = "Virtual machines names in uppercase"
}
output "vm_joined_tags" {
  value       = join(", ", values(azurerm_virtual_machine.main[0].tags))
  description = "Joined tags from virtual machine"
}
output "vm_ids" {
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
  description = "Virtual machines IDs"
}