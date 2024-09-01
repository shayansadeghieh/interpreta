# Output the name of the network
output "network_name" {
  description = "The name of the network to be provided to the cluster"
  value = google_compute_network.vpc.name
}

# Output the name of the subnetwork
output "subnet_name" {
  description = "The name of the subnetwork to be provided to the cluster"
  value = google_compute_subnetwork.subnet.name
}