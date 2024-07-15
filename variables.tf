variable "project_id" {
  description = "The project ID to deploy to"
}

variable "region" {
  description = "The region to deploy to"
  default     = "europe-west1"
}

variable "zone" {
  description = "The zone to deploy to"
  default     = "europe-west1-b"
}

variable "credentials_file" {
  description = "The path to the GCP credentials file"
}

variable "instance_name" {
  description = "The name of the compute instance"
  default     = "terraform-instance"
}

variable "machine_type" {
  description = "The type of machine to create"
  default     = "f1-micro"
}

variable "image" {
  description = "The image to use for the boot disk"
  default     = "debian-cloud/debian-11"
}

variable "static_ip_name" {
  description = "The name of the static IP"
  default     = "my-static-ip2"
}

variable "firewall_name" {
  description = "The name of the firewall rule"
  default     = "allow-http"
}

variable "startup_script" {
  description = "The path to the startup script"
}
