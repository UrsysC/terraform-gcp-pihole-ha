resource "google_compute_network" "pihole_vpc" {
  name                    = "pihole-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "pihole_subnet_a" {
  name = "pihole-subnet-a"
  #we don't need more than a handful of IP addresses...
  ip_cidr_range = "10.0.1.0/28"
  region        = var.region
  network       = google_compute_network.pihole_vpc.id
}
#restricts all traffic to be only from your public IP address
resource "google_compute_firewall" "pihole_ingress_rules" {
  name    = "pihole-ingress-fw"
  network = google_compute_network.pihole_vpc.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "53", "443"]
  }
  allow {
    protocol = "udp"
    ports    = ["53"]
  }
  source_ranges  = [
    var.my_public_ip
  ]
  direction      = "INGRESS"
  enable_logging = true
}

resource "google_compute_firewall" "allow-ssh-for-troubleshooting" {
  name    = "allow-ssh-for-troubleshooting"
  network = google_compute_network.pihole_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  priority = 1000
}

resource "google_compute_firewall" "pihole_egress_rules" {
  name    = "pihole-egress-fw"
  network = google_compute_network.pihole_vpc.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "53", "443"]
  }
  allow {
    protocol = "udp"
    ports    = ["53"]
  }
  destination_ranges = [
    var.my_public_ip
  ]
  direction          = "EGRESS"
}

resource "google_compute_address" "pihole_a_external_address" {
  name = "pihole-a-external-address"
  address_type = "EXTERNAL"
  region       = var.region
}

resource "google_compute_address" "pihole_a_internal_address" {
  name = "pihole-a-internal-address"
  subnetwork   = google_compute_subnetwork.pihole_subnet_a.id
  address_type = "INTERNAL"
  purpose      = "GCE_ENDPOINT"
  region       = var.region
}
