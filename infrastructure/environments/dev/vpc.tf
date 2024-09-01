# VPC
module "vpc" {
  source        = "../../modules/network"
  project_id    = var.project_id
  region        = var.region
  ip_cidr_range = var.ip_cidr_range
}