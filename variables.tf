variable "prefix" {
  default = "tfvmex"
}

variable "admin_username" {
  default = "testadmin"
}

variable "admin_password" {
  default = "Password1234!"
}

variable "environment" {
  type = string
  default = "staging"
}


variable "locations" {
  type = list(string)
  default = ["UK West", "East US", "North Europe"]
}