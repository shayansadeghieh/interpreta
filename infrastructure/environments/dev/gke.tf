module "k8s_cluster" {
  source       = "../../modules/cluster"
  project_id   = var.project_id
  region       = var.region
  machine_type = "n1-standard-1"
  network      = module.vpc.network_name
  subnetwork   = module.vpc.subnet_name
  num_nodes    = 2
  zone         = var.zone 
}