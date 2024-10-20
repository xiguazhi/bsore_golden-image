// vSphere Settings
// vSphere Credentials
vsphere_endpoint            = "vcenter.bsorenson.io"
vsphere_username            = "administrator@vsphere.local"
vsphere_password            = "0zgJl2ArwQ'^1jv&B{8'"
vsphere_insecure_connection = false

// vSphere Settings
vsphere_datacenter                     = "bsorenson.io"
// vsphere_cluster                        = ""
vsphere_host                         = "10.0.4.40"
vsphere_datastore                      = "samsung"
vsphere_network                        = "Server VLAN"
vsphere_folder                         = "Templates"
//vsphere_resource_pool                = "sfo-w01-rp01"
vsphere_set_host_for_datastore_uploads = false
vm_guest_os_type         = "ubuntu64Guest"
iso_datastore_path                 = "ISOs/"
iso_file                 = "Ubuntu2404.iso"
iso_checksum_value       = "459ba1f67d0b25c63c240f466c0e640694ba35c60ee80346abfd82a9e88c3d61"
iso_checksum_type        = "sha256"
vm_mem_size              = 4096
communicator_timeout     = "25m"
common_http_port_min     = 8080
common_http_port_max     = 8888
common_shutdown_timeout  = "5m"
common_vm_version        = 18
communicator_port        = 22
build_password_encrypted = "$6$jkl$Q4vPZ3C6Rjnl6vAbdssxJPbNxPhA/MYqd9D7lBQHumIX7l3Nb4uh1nmdmj2WBCyxPbu8/TXbDXSfdiqj2H.zM0"
build_password = "ad594qjA"
vsphere_cluster          = "prod"
vsphere_network = "Server VLAN"
common_iso_datastore = "samsung"
vm_guest_os_name = ""
vsphere_insecure_connection = true
build_password = 
// Guest Operating System Metadata
vm_guest_os_name     = "ubuntu"
vm_guest_os_version  = "24.04-lts"

// Virtual Machine Guest Operating System Setting
vm_guest_os_type      = "ubuntu64Guest"

// Virtual Machine Hardware Settings
vm_firmware              = "efi-secure"

// Removable Media Settings
iso_datastore_path       = "iso/linux/ubuntu"
iso_content_library_item = "ubuntu-24.04-live-server-amd64"
iso_file                 = "ubuntu-24.04-live-server-amd64.iso"