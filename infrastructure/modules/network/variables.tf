variable "project_id" {
  type        = string
  description = "Google cloud project ID"
}

variable "region" {
  type        = string
  description = "The google cloud region to deploy to"
}

variable "ip_cidr_range" {
    type = string
    description = "IP range for the subnet"
}