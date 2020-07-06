variable "project_name" {
  type        = string
  description = "Your GCP Project Name."
}

variable "project_owner" {
  type        = string
  description = "GSuite Group to grant project owner permissions."
}

variable "project_monthly_budget" {
  type        = string
  description = "Project Budget."
}

variable "my_public_ip" {
  type        = string
  description = "Your public IP address."
}

variable "region" {
  type        = string
  description = "The GCP region you want your piholes in."
  default     = "us-central1"
}

variable "organization_id" {
  type        = string
  description = "Your GCP Organization ID."
}

variable "billing_account_id" {
  type        = string
  description = "Your GCP Billing Account ID."
  default     = "us-central1"
}

variable "terraform_service_account" {
  type        = string
  description = "Your terraform service account user."
  default     = "us-central1"
}
