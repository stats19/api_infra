
#
# TERRAFORM AUTHENTICATION
#
variable "tenant_id" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}
variable "image_tag" {
  type = string
}
variable "registry_url" {
  type = string
}
variable "database_host" {
  type = string
}
variable "database_port" {
  type = number
}
variable "database_username" {
  type = string
}
variable "database_password" {
  type = string
}
variable "google_api_key" {
  type = string
}
variable "map_api_url" {
  type = string
}