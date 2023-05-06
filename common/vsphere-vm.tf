module "pipeline" {
  source           = "git@github.com:xiguazhi/terraform-vsphere.git//modules/wtw-linux-vm"
  environment      = "dev"
  vmtemp           = "template-centos8_64Guest"
  application_name = "kubespray"
  node_count       = 3
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  disk_size_gb     = ["60"]
}