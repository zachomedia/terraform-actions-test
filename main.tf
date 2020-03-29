resource "random_string" "random" {
  length  = 16
  special = false
  upper   = false
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${random_string.random.result}-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "storage" {
  name                     = random_string.random.result
  location                 = "Canada Central"
  resource_group_name      = ""
  account_tier             = "Standard"
  account_kind             = "BlobStorage"
  account_replication_type = "LRS"
  # enable_blob_encryption = "True"
  # enable_file_encryption = "True"
  access_tier = "Hot"
}
