########################
# public ip addresses
########################

locals {
  default_freeform_tags = {
    terraformed = "Please do not edit manually"
    module      = "oracle-terraform-oci-public-ip"
  }
  merged_freeform_tags = merge(var.freeform_tags, local.default_freeform_tags)
  compartment_id       = try(data.oci_identity_compartments.compartment[0].compartments[0].id, var.compartment_id)
  network_cmp_id       = try(data.oci_identity_compartments.network[0].compartments[0].id, var.network_cmp_id)
  subnet_id            = data.oci_core_subnets.subnets.subnets[0].id
  private_ip_id        = try(data.oci_core_private_ips.ip.private_ips[0].id, var.private_ip_id)
}

resource "oci_core_public_ip" "main" {
  #Required
  compartment_id = local.compartment_id
  lifetime       = var.lifetime

  #Optional
  display_name      = var.display_name
  private_ip_id     = local.private_ip_id
  public_ip_pool_id = var.public_ip_pool_id
  freeform_tags     = local.merged_freeform_tags
  defined_tags      = var.defined_tags

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}