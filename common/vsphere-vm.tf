module "pipeline" {
  source = "git@github.com:xiguazhi/terraform-vsphere.git"
  environment      = "dev"
  source           = "../modules/wtw-vm-linux/"
  vmtemp           = "Ubuntu2004"
  application_name = "pipeline"
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  disk_size_gb     = ["60"]  
}