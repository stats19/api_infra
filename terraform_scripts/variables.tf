
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
variable "port" {
  type = string
}
variable "image_tag" {
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
variable "database_db" {
  type = string
}
variable "google_api_key" {
  type = string
}
variable "map_api_url" {
  type = string
}
variable "lucene_path" {
  type = string
}