
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
variable "secret_key" {
  type = string
}
variable "database_host" {
  type = string
}
variable "rabbit_host" {
  type = string
}
variable "rabbit_port" {
  type = string
}
variable "rabbit_username" {
  type = string
}
variable "rabbit_password" {
  type = string
}
variable "rabbit_addresses" {
  type = string
}