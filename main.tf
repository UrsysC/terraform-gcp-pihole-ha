terraform {
  required_version = ">=0.12.26"
}

provider "google" {
  version = "~> 3.11"
  project = module.gcp-create-project.created_project.project_id
  #module.gcp-create-project.created_project.project_id
}

module "gcp-create-project" {
  source  = "UrsysC/createProject/gcp"
  version = "1.1.0"
  organization_id = var.organization_id
  billing_account_id = var.billing_account_id
  project_name = var.project_name
  project_owner = var.project_owner
  project_monthly_budget = var.project_monthly_budget
  terraform_service_account = var.terraform_service_account
  enable_automatic_iam = true
}

resource "google_project_service" "compute_api" {
  project = module.gcp-create-project.created_project.project_id
  service = "compute.googleapis.com"
}

# plan: copy ansible playbook, install ansible, docker through startup script on remote host,
# execute ansible playbook against localhost

# TODO: write ansible playbook to install nginx, pihole, certbot images
# configure pihole lightppd inside container to use letsencrypt
# add GCP DNS
#
