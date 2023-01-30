
variable "fortigate_ip" {
  type = string
  sensitive = true
}

variable "fortigate_api_token" {
  type = string
  sensitive = true
}

variable "ip_add" {
  type = string
}

variable "vm_name" {
  type = string
}
