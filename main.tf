terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Reserve a static external IP for SSH/Ansible
resource "google_compute_address" "uptime_ip" {
  name = "uptime-monitor-ip"
}

# Allow SSH inbound from anywhere (restrict if you prefer)
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-uptime"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

# Create the VM
resource "google_compute_instance" "uptime_monitor" {
  name         = "uptime-monitor"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.uptime_ip.address
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }
}

# Output
output "uptime_monitor_ip" {
  description = "The external IP of the uptime-monitor VM"
  value       = google_compute_address.uptime_ip.address
}