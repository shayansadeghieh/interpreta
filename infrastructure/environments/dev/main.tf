#######################
# TF STATE BUCKET
#######################
resource "random_id" "default" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name     = "${random_id.default.hex}-terraform-remote-backend"
  project  = "interpreta"
  location = "US"

  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

#######################
# APIs
#######################
module apis {
  source = "../../modules/apis"
  project_id = var.project_id 
  api_name = each.key
  for_each = toset([
    "serviceusage", # Must be enabled to apply this with terraform
    "cloudresourcemanager",
    "iam",
    "storage",
    "container",
    "secretmanager",
    "artifactregistry"
  ])
}