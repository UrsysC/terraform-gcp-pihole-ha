resource "google_compute_instance" "pihole_a_instance" {
  name           = "pihole-a"
  machine_type   = "f1-micro"
  zone           = join("-", [var.region, "a"])
  can_ip_forward = true
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"
      type  = "pd-ssd"
      size  = "20"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.pihole_subnet_a.self_link
    network_ip = google_compute_address.pihole_a_internal_address.address
    access_config {
      nat_ip = google_compute_address.pihole_a_external_address.address
    }
  }

  metadata_startup_script = file("scripts/startup.sh")

}

resource "google_compute_project_metadata_item" "default" {
  key   = "my_metadata"
  value = "my_value_custom"
}
