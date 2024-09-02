resource "google_service_account" "default" {
  project = var.project_id
  account_id   = "${var.project_id}-cluster-sa"
  display_name = "${var.project_id}-cluster-sa"
}

// Required to pull images from artifact registry 
resource "google_project_iam_member" "artifact_registry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.default.email}"
}

resource "google_container_cluster" "primary" {
  project = var.project_id
  name     = "${var.project_id}-gke"
  location = var.zone

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection = false

  network = var.network
  subnetwork = var.subnetwork
}

data "google_container_engine_versions" "gke_version" {
  project = var.project_id
  location = var.zone
  version_prefix = "1.29."
}

# Separately managed node pool 
resource "google_container_node_pool" "primary_nodes" {
  project = var.project_id
  name       = "${var.project_id}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name  
  node_count = var.num_nodes 

  version = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]  

  node_config {
    preemptible  = true # Preemptible nodes provide no guarantee of availability
    machine_type = var.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}