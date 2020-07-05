resource "google_compute_instance" "default" {
  name           = "pihole_a"
  machine_type   = "f1-micro"
  zone           = "$(var.region)-a"
  can_ip_forward = true
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      type  = "pd-ssd"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.pihole_subnet_a.self_link
    network_ip = "10.0.0.1"
  }
  metadata_startup_script = file(scripts / startup.sh)
}
