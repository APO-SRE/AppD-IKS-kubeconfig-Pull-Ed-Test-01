# Variables ----------------------------------------------------------------------------------------
variable "apikey" {
  description = "Intersight API Key."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key or file location."
  type        = string
}

variable "endpoint" {
  description = "Intersight API Endpoint URL."
  type        = string
  default     = "https://www.intersight.com"
}

variable "cluster_name" {
  description = "Name of the IKS Cluster."
  type        = string
}
