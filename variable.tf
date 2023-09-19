variable "tags" {
  description = "Tags to be applied to the resources"
  type = map(string)
  default = {}
}

variable "location" {
  description = "Azure region where resources should be provisioned"
  type        = string
  default     = "eastus"
}

variable "azure_resource_group" {
  description = "Name of the Azure resource group where resources will be provisioned"
  type = string
  default = "acr-demo-rg"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type = string
  default = "acrwebinardemo123"
}
variable "acr_sku" {
  description = "SKU of the Azure Container Registry"
  default = "Premium"

  validation {
    condition     = contains(["Premium"], var.acr_sku)
    error_message = "Argument \"acr_sku\" must be either \"Premium\" in order to support private endpoints."
  }
}




