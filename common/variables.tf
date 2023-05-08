variable "node_count" {}
variable "environment" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "subnets" {
  type = list(object(
    {
      name = string
      prefix = string
    }
  ))
  description = "subnets for VNET and subnet creation in azure"
  default = [
    {
      name   = "bsore-Gateway"
      prefix = "10.0.70.0/24"
    },
    {
      name   = "bsore-FrontEnd"
      prefix = "10.0.80.0/24"
    }
  ]
}