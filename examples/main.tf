// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

module "public_ip" {
  source = "../"

  for_each = var.public_ips

  tenancy_ocid = var.tenancy_ocid
  compartment  = each.value["compartment"]
  network_cmp  = each.value["network_cmp"]
  subnet_name  = each.value["subnet_name"]
  display_name = each.key
  private_ip   = each.value["private_ip"]
}