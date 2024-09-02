resource "google_artifact_registry_repository" "dev-registry" {
  project = var.project_id
  location      = var.region
  repository_id = "dev"    
  format        = "DOCKER"
  docker_config {
    immutable_tags = false  
  }  
}