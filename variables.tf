# Variables ----------------------------------------------------------------------------------------
variable "intersight_apikey" {
  description = "Intersight API Key."
  type        = string
}

variable "intersight_secretkey" {
  description = "Intersight Secret Key or file location."
  type        = string
}

variable "intersight_endpoint" {
  description = "Intersight API Endpoint URL."
  type        = string
  default     = "https://www.intersight.com"
}

variable "iks_cluster_name" {
  description = "Name of the IKS Cluster."
  type = string
}
