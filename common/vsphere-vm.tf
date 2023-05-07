module "kubespray" {
  source           = "git@github.com:xiguazhi/terraform-vsphere.git//modules/wtw-vm-linux"
  environment      = var.environment
  vmtemp           = "template-centos8_64guest"
  application_name = "kubespray"
  node_count       = var.node_count
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  disk_size_gb     = ["60"]
  ipv4_address = ["","",""]
  network_type = ["vmxnet3","vmxnet3","vmxnet3"]
  ipv4_gateway = "10.0.30.1"
  ipv4submask = ["24","24","24"]
}