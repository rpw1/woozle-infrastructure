locals {
  web_settings = {
    DOCKER_REGISTRY_SERVER_URL      = "https://ghcr.io"
    DOCKER_REGISTRY_SERVER_USERNAME = data.azurerm_key_vault_secret.docker_username.value
    DOCKER_REGISTRY_SERVER_PASSWORD = data.azurerm_key_vault_secret.docker_password.value
  }
}