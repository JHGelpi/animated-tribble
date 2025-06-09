variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "data2insights-462216"
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
  default     = "wgelpi"
}
variable "public_key_path" {
  description = "Path to your local SSH public key"
  type        = string
  default     = "/home/wgelpi/.ssh/id_rsa.pub"
}