terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.16.0"
    }
  }
}

terraform {
  cloud {
    organization = "daeric"

    workspaces {
      name = "terraform-vmware-ubuntu"
    }
  }
}

data "terraform_remote_state" "ubuntu" {
  backend = "remote"

  config = {
    organization = "daeric"
    workspaces = {
      name = "terraform-vmware-ubuntu"
    }
  }
}

provider "fortios" {
  hostname = var.fortigate_ip
  token    = var.fortigate_api_token
  insecure = "true"
}

resource "fortios_firewall_address" "myvmaddress" {
  name                 = data.terraform_remote_state.ubuntu.outputs.name
  subnet               = "${data.terraform_remote_state.ubuntu.outputs.ip}/32"
  type                 = "ipmask"
  associated_interface = "lan"
  visibility           = "enable"
}
