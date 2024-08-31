terraform {
  required_version = ">= 1.9.5"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 6.0.1"
    }    
  }

  backend "gcs" {
    bucket = "f3a5bc2200f5a2bb-terraform-remote-backend"
  }
}
