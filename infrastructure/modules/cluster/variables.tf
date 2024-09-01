variable "project_id" {
  type        = string
  description = "Google cloud project ID"
}

variable "region" {
  type        = string
  description = "The google cloud region to deploy to"
}

variable "zone" {
  type        = string
  description = "The google cloud zone to deploy to"
}

variable "machine_type" {
    type = string
    description = "Node machine type"
}

variable "network" {
    type = string
    description = "The name of the Google Compute Engine network to which the cluster is connected"
}

variable "subnetwork" {
  type = string
  description = "The name of the Google Compute Engine subnetwork in which the cluster's instances are launched"
}

variable "num_nodes" {
  type = number
  description = "The number of nodes per instance group"
}