module "pipeline" {
  source           = "git@github.com:xiguazhi/terraform-vsphere.git//modules/wtw-linux-vm"
  environment      = var.environment
  vmtemp           = "template-centos8_64Guest"
  application_name = "kubespray"
  node_count       = var.node_count
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  disk_size_gb     = ["60"]
}