terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "buckets" {
  for_each = var.buckets
  name     = each.key
  location = var.region
  labels   = each.value.labels
}