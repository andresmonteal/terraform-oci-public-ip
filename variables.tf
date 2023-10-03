// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

variable "tenancy_ocid" {
  description = "(Required) (Updatable) The OCID of the root compartment."
  type        = string
  default     = null
}

variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
  default     = null
}

variable "compartment" {
  description = "compartment name where to create all resources"
  type        = string
  default     = null
}

variable "display_name" {
  description = " (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
  type        = string
}

variable "lifetime" {
  description = "(Required) Defines when the public IP is deleted and released back to the Oracle Cloud Infrastructure public IP pool."
  type        = string
  default     = "RESERVED"
}

variable "private_ip_id" {
  description = "(Optional) (Updatable) The OCID of the private IP to assign the public IP to."
  type        = string
  default     = null
}

variable "private_ip" {
  description = "(Optional) (Updatable) The private IP to assign the public IP to."
  type        = string
  default     = null
}

variable "public_ip_pool_id" {
  description = "(Optional) The OCID of the public IP pool."
  type        = string
  default     = null
}

variable "network_cmp" {
  description = "Compartment name for networking resources"
  type        = string
  default     = null
}

variable "network_cmp_id" {
  description = "Compartment id for networking resources"
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "simple key-value pairs to tag the resources created using freeform tags."
  type        = map(string)
  default     = null
}

variable "defined_tags" {
  description = "predefined and scoped to a namespace to tag the resources created using defined tags."
  type        = map(string)
  default     = null
}