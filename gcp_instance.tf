provider "google" {
    credentials = file(var.credentials_file)
    project     = var.project_id
    region      = var.region
}

resource "google_compute_address" "static_ip" {
    name   = var.static_ip_name
    region = var.region
}

resource "google_compute_instance" "default" {
    name         = var.instance_name
    machine_type = var.machine_type
    zone         = var.zone

    boot_disk {
        initialize_params {
        image = var.image
        }
    }

    network_interface {
        network = "default"
        access_config {
        nat_ip = google_compute_address.static_ip.address
        }
    }

    metadata_startup_script = file(var.startup_script)

    tags = ["http-server"]
}

resource "google_compute_firewall" "default" {
    name    = var.firewall_name
    network = "default"

    allow {
        protocol = "tcp"
        ports    = ["80"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["http-server"]
}
