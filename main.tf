resource "random_string" "name" {
  length  = 16
  special = false
  upper   = false
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${random_string.name.result}-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "storage" {
  name                     = random_string.name.result
  location                 = "Canada Central"
  resource_group_name      = ""
  account_tier             = "Standard"
  account_kind             = "BlobStorage"
  account_replication_type = "LRS"
  # enable_blob_encryption = "True"
  # enable_file_encryption = "True"
  access_tier = "Hot"
}
