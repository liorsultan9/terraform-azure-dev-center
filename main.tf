terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # ה-Backend שומר את ה"זיכרון" של טרפורם בתוך ה-Storage Account שיצרנו ידנית
  backend "azurerm" {
    resource_group_name  = "rg-terraform-mgmt"
    storage_account_name = "tfstatelior2026"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {} # חובה להשאיר ריק ב-Azure
}

# 1. יצירת ה-Resource Group הראשי (זה ה"בית" של המשאבים)
resource "azurerm_resource_group" "example" {
  name     = "rg-my-dev-center"
  location = "West Europe"
}

# 2. יצירת ה-Storage Accounts בלולאה לפי המשתנה buckets מתוך variables.tf
resource "azurerm_storage_account" "st" {
  for_each                 = var.buckets # כאן הקסם קורה - הוא עובר על המפה שהגדרנו
  
  # השם חייב להיות ייחודי גלובלית, רק אותיות קטנות ומספרים
  name                     = "${lower(each.key)}lior2026" 
  
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # הוספת התגיות (Labels) שהגדרנו במשתנים
  tags = each.value.labels
}