variable "region_configuration" {
  type = object({
    location = string 
    prefix   = string
  })
}

variable "sku_name" {
  type = string 
}

variable "resource_group_name" {
  type = string
}

variable "subscription_id" {
  type = string
}