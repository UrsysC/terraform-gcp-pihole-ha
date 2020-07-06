output "external_ip_address" {
  value = google_compute_address.pihole_a_external_address.address
}

output "internal_ip_address" {
  value = google_compute_address.pihole_a_internal_address.address
}
