terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # הוספת ה-Backend (הזיכרון) כדי שה-State יישמר באז'ור ולא אצלך במחשב
  backend "azurerm" {
    resource_group_name  = "rg-terraform-mgmt"   # שם ה-Resource Group שבו נמצא ה-Storage
    storage_account_name = "tfstatelior2026"     # שם ה-Storage Account שיצרת עבור ה-State
    container_name       = "tfstate"             # שם ה-Container
    key                  = "terraform.tfstate"   # שם הקובץ שיווצר
  }
}

provider "azurerm" {
  features {} # חובה ב-Azure
}

# דוגמה ליצירת משאב באז'ור (במקום ה-Bucket של גוגל)
resource "azurerm_resource_group" "example" {
  name     = "rg-my-dev-center"
  location = "West Europe"
}
