variable "project_id" {
  description = "GCP project ID"
  type        = string
}
variable "region" {
  description = "GCP region (e.g. us-central1)"
  type        = string
  default     = "us-central1"
}
variable "zone" {
  description = "GCP zone (e.g. us-central1-a)"
  type        = string
  default     = "us-central1-a"
}
variable "ssh_user" {
  description = "SSH username for Ansible"
  type        = string
}
variable "public_key_path" {
  description = "Path to your local SSH public key"
  type        = string
}