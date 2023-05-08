variable "node_count" {}
variable "environment" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "subnets" {
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