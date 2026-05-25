variable "project_id" {
  type        = string
  description = "The name of the resource group"
  default     = "production"
}

variable "region" {
  type    = string
  default = "East US"
}

variable "buckets" {
  type = map(object({
    labels = map(string)
  }))
  default = {
    "storage1" = {
      labels = { "env" = "prod" }
    },
    "storage2" = {
      labels = { "env" = "test" }
    },
    "storage3" = {
      labels = { "env" = "dev" }
    },
    "storage4" = {
      labels = { "env" = "dev" }
    },
    "storage5" = {
      labels = { "env" = "dev" }
    },
    "storage7" = {
      labels = { "env" = "dev" }
    },
     "storage8" = {
      labels = { "env" = "dev" }
    },
     "storage9" = {
      labels = { "env" = "dev" }
    },
    "storage10" = {
      labels = { "env" = "dev" }
    },
    
  }
}