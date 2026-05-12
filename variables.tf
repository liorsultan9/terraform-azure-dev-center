variable "project_id" {
  type        = string
  description = "The name of the resource group"
  default     = "production" # זה השם של ה-RG שיצרת באז'ור
}

variable "region" {
  type        = string
  default     = "East US" # אז'ור משתמש בשמות כמו East US ולא us-central1
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
    }
    
    "storage3" = {
      labels = { "env" = "dev" }
    }

     "storage4" = {
      labels = { "env" = "dev" }
    }


  }
}