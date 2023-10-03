data "oci_identity_compartments" "compartment" {
  count = var.tenancy_ocid == null ? 0 : 1
  #Required
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  #Optional
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.compartment]
  }
}

data "oci_identity_compartments" "network" {
  count = var.network_cmp == null ? 0 : 1
  #Required
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  #Optional
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.network_cmp]
  }
}

data "oci_core_subnets" "subnets" {
  #Required
  compartment_id = local.network_cmp_id

  #Optional
  display_name = var.subnet_name
}

data "oci_core_private_ips" "ip" {
  #Optional
  ip_address = var.private_ip
  subnet_id  = local.subnet_id
}

variable "subnet_name" {
  description = "Virtual cloud network subnet name"
  default     = ""
  type        = string
}