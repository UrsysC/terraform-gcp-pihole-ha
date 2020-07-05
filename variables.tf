variable "project_id" {
  type        = string
  description = "Your GCP Project ID."
}

variable "my_public_ip" {
  type        = string
  description = "Your public IP address."
}

variable "region" {
  type        = string
  description = "The GCP region you want your first pihole in."
  default     = "us-central1"
}
