data "azurerm_key_vault" "kv_woozle" {
  name                = var.keyvault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "docker_username" {
  name             = "docker-username"
  key_vault_id     = data.azurerm_key_vault.kv_woozle.id
}

data "azurerm_key_vault_secret" "docker_password" {
  name             = "docker-password"
  key_vault_id     = data.azurerm_key_vault.kv_woozle.id
}