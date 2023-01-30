terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
      version = "1.14.1"
    }
  }
}

provider "fortios" {
  hostname = var.fortigate_ip
  token    = var.fortigate_api_token
  insecure = "true"
}

resource "fortios_firewall_address" "myvmaddress" {
  name       = var.vm_name
  subnet     = var.ip_add
  type       = "ipmask"
  visibility = "enable"
}
