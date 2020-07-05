terraform {
  required_version = ">=0.12.26"
}

provider "google" {
  version = "~> 3.11"
  project = var.project_id
  #module.gcp-create-project.created_project.project_id
}

resource "google_project_service" "compute_api" {
  project = var.project_id
  service = "compute.googleapis.com"
}
