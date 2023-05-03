/*
    DESCRIPTION:
    CentOS Stream 8 template using the Packer Builder for VMware vSphere (vsphere-iso).
*/
/*
    DESCRIPTION:
    CentOS Stream 8 variables using the Packer Builder for VMware vSphere (vsphere-iso).
*/

//  BLOCK: variable
//  Defines the input variables.

// vSphere Credentials

variable "vsphere_endpoint" {
  type        = string
  description = "The fully qualified domain name or IP address of the vCenter Server instance. (e.g. 'sfo-w01-vc01.sfo.rainpole.io')"
  default = "vcenter.bsorenson.io"
}

variable "vsphere_host" {
  type = string
  description = "IP Address of host to create VM on (because no cluster)"
  default = "10.0.4.40"
}

variable "vsphere_username" {
  type        = string
  description = "The username to login to the vCenter Server instance. (e.g. 'svc-packer-vsphere@rainpole.io')"
  sensitive   = true
  default = "svc-ansible"
}

variable "vsphere_password" {
  type        = string
  description = "The password for the login to the vCenter Server instance."
  default = env("VSPHERE_PASSWORD")
  sensitive   = true
}

variable "vsphere_insecure_connection" {
  type        = bool
  description = "Do not validate vCenter Server TLS certificate."
  default = true
}

// vSphere Settings

variable "vsphere_datacenter" {
  type        = string
  description = "The name of the target vSphere datacenter. (e.g. 'sfo-w01-dc01')"
  default = "bsorenson.io"
}

variable "vsphere_cluster" {
  type        = string
  description = "The name of the target vSphere cluster. (e.g. 'sfo-w01-cl01')"
}

variable "vsphere_datastore" {
  type        = string
  description = "The name of the target vSphere datastore. (e.g. 'sfo-w01-cl01-vsan01')"
  default = "wdblue"
}

variable "vsphere_network" {
  type        = string
  description = "The name of the target vSphere network segment. (e.g. 'sfo-w01-dhcp')"
  default = "Server VLAN"
}

variable "vsphere_folder" {
  type        = string
  description = "The name of the target vSphere cluster. (e.g. 'sfo-w01-fd-templates')"
  default = "Dev"
}

// Virtual Machine Settings

variable "vm_guest_os_language" {
  type        = string
  description = "The guest operating system lanugage."
  default     = "en_US"
}

variable "vm_guest_os_keyboard" {
  type        = string
  description = "The guest operating system keyboard input."
  default     = "us"
}

variable "vm_guest_os_timezone" {
  type        = string
  description = "The guest operating system timezone."
  default     = "UTC"
}

variable "vm_guest_os_family" {
  type        = string
  description = "The guest operating system family. Used for naming and VMware tools. (e.g. 'linux')"
  default = "linux"
}

variable "vm_guest_os_name" {
  type        = string
  description = "The guest operating system name. Used for naming . (e.g. 'centos-stream')"
  default = "centos-stream"
}

variable "vm_guest_os_version" {
  type        = string
  description = "The guest operating system version. Used for naming. (e.g. '8')"
  default = "8"
}

variable "vm_guest_os_type" {
  type        = string
  description = "The guest operating system type, also know as guestid. (e.g. 'centos8_64Guest')"
  default = "centos8_64guest"
}

variable "vm_firmware" {
  type        = string
  description = "The virtual machine firmware. (e.g. 'efi-secure'. 'efi', or 'bios')"
  default     = "efi-secure"
}

variable "vm_cdrom_type" {
  type        = string
  description = "The virtual machine CD-ROM type. (e.g. 'sata', or 'ide')"
  default     = "sata"
}

variable "vm_cpu_count" {
  type        = number
  description = "The number of virtual CPUs. (e.g. '2')"
  default = 1
}

variable "vm_cpu_cores" {
  type        = number
  description = "The number of virtual CPUs cores per socket. (e.g. '1')"
  default = 2
}

variable "vm_cpu_hot_add" {
  type        = bool
  description = "Enable hot add CPU."
  default     = true
}

variable "vm_mem_size" {
  type        = number
  description = "The size for the virtual memory in MB. (e.g. '2048')"
}

variable "vm_mem_hot_add" {
  type        = bool
  description = "Enable hot add memory."
  default     = true
}

variable "vm_disk_size" {
  type        = number
  description = "The size for the virtual disk in MB. (e.g. '40960')"
  default = "40960"
}

variable "vm_disk_controller_type" {
  type        = list(string)
  description = "The virtual disk controller types in sequence. (e.g. 'pvscsi')"
  default     = ["pvscsi"]
}

variable "vm_disk_thin_provisioned" {
  type        = bool
  description = "Thin provision the virtual disk."
  default     = true
}

variable "vm_network_card" {
  type        = string
  description = "The virtual network card type. (e.g. 'vmxnet3' or 'e1000e')"
  default     = "vmxnet3"
}

variable "common_vm_version" {
  type        = number
  description = "The vSphere virtual hardware version. (e.g. '19')"
}

variable "common_tools_upgrade_policy" {
  type        = bool
  description = "Upgrade VMware Tools on reboot."
  default     = true
}

variable "common_remove_cdrom" {
  type        = bool
  description = "Remove the virtual CD-ROM(s)."
  default     = true
}

// Template and Content Library Settings

variable "common_template_conversion" {
  type        = bool
  description = "Convert the virtual machine to template. Must be 'false' for content library."
  default     = true
}

variable "common_content_library_name" {
  type        = string
  description = "The name of the target vSphere content library, if used. (e.g. 'sfo-w01-cl01-lib01')"
  default     = null
}

variable "common_content_library_ovf" {
  type        = bool
  description = "Export to content library as an OVF template."
  default     = false
}

variable "common_content_library_destroy" {
  type        = bool
  description = "Delete the virtual machine after exporting to the content library."
  default     = false
}

variable "common_content_library_skip_export" {
  type        = bool
  description = "Skip exporting the virtual machine to the content library. Option allows for testing / debugging without saving the machine image."
  default     = false
}

// OVF Export Settings

variable "common_ovf_export_enabled" {
  type        = bool
  description = "Enable OVF artifact export."
  default     = false
}

variable "common_ovf_export_overwrite" {
  type        = bool
  description = "Overwrite existing OVF artifact."
  default     = true
}

// Removable Media Settings

variable "common_iso_datastore" {
  type        = string
  description = "The name of the source vSphere datastore for ISO images. (e.g. 'sfo-w01-cl01-nfs01')"
  default = "samsung"
}

variable "iso_path" {
  type        = string
  description = "The path on the source vSphere datastore for ISO image. (e.g. 'iso/linux/centos')"
  default = "ISOs"
}

variable "iso_file" {
  type        = string
  description = "The file name of the ISO image used by the vendor. (e.g. 'CentOS-Stream-<version>-x86_64-latest-dvd1.iso')"
  default = "CentOS_8.iso"
}

variable "iso_checksum_type" {
  type        = string
  description = "The checksum algorithm used by the vendor. (e.g. 'sha256')"
}

variable "iso_checksum_value" {
  type        = string
  description = "The checksum value provided by the vendor."
}

// Boot Settings

variable "common_data_source" {
  type        = string
  description = "The provisioning data source. (e.g. 'http' or 'disk')"
  default = "http"
}

variable "common_http_ip" {
  type        = string
  description = "Define an IP address on the host to use for the HTTP server."
  default     = null
}

variable "common_http_port_min" {
  type        = number
  description = "The start of the HTTP port range."
}

variable "common_http_port_max" {
  type        = number
  description = "The end of the HTTP port range."
}

variable "vm_boot_order" {
  type        = string
  description = "The boot order for virtual machines devices. (e.g. 'disk,cdrom')"
  default     = "disk,cdrom"
}

variable "vm_boot_wait" {
  type        = string
  description = "The time to wait before boot."
  default = "15s"
}

variable "common_ip_wait_timeout" {
  type        = string
  description = "Time to wait for guest operating system IP address response."
  default = "15m"
}

variable "common_shutdown_timeout" {
  type        = string
  description = "Time to wait for guest operating system shutdown."
}

// Communicator Settings and Credentials

variable "build_username" {
  type        = string
  description = "The username to login to the guest operating system. (e.g. 'rainpole')"
  sensitive   = true
  default = "svc-ansible"
}

variable "build_password" {
  type        = string
  description = "The password to login to the guest operating system."
  sensitive   = true
  default = env("BUILD_PASSWORD")
}

variable "build_password_encrypted" {
  type        = string
  description = "The SHA-512 encrypted password to login to the guest operating system."
  sensitive   = true
}

variable "build_key" {
  type        = string
  description = "The public key to login to the guest operating system."
  sensitive   = true
  default = env("BUILD_KEY")
}

variable "communicator_proxy_host" {
  type        = string
  description = "A SOCKS proxy host to use for SSH connection."
  default     = null
}

variable "communicator_proxy_port" {
  type        = number
  description = "A port of the SOCKS proxy."
  default     = null
}

variable "communicator_proxy_username" {
  type        = string
  description = "The optional username to authenticate with the proxy server."
  default     = null
}

variable "communicator_proxy_password" {
  type        = string
  description = "The optional password to authenticate with the proxy server."
  sensitive   = true
  default     = null
}

variable "communicator_port" {
  type        = string
  description = "The port for the communicator protocol."
}

variable "communicator_timeout" {
  type        = string
  description = "The timeout for the communicator protocol."
}

// Ansible Credentials

variable "ansible_username" {
  type        = string
  description = "The username for Ansible to login to the guest operating system. (e.g. 'ansible')"
  default = env("BUILD_USER")
  sensitive   = true
}

variable "ansible_key" {
  type        = string
  description = "The public key for Ansible to login to the guest operating system."
  sensitive   = true
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCw0fg4PYhRjeMerr8xLqcWz5fBSkK0qvNFYW6s2X8RhplqpNUVIMXW2FwmpD2mFbsLgMxGWQjZrR8Rjn8Zg95Q4r9hvOei8UtqXPrylxkP2eEPiKWM9j2etksoMY54F2Ojvnhz48u47oNGNicbT+XyBTLNg9OXwRS/Wdl17L0uLgp29EptWPN28p8DMSzGfkaU6GurblxbjkQCgYR3rM5HWCk6WApyxa2b7pvAykDHlvyQY1RejBTjCeh80Y7Yo8HoqvuQ7QZHUWACiVDGe1MWFNHwGcaAUgltNqUTS3w1cFpVLyryAudD9SPwNFk+v2qYaZo31gat7t0Q+yTNv7Ry7cnsc9kjAmo82QVO9DaRxddzbEuh+ywpdnp7sE5y/UyCJPLXZvhTOaDbl8YJ/fhPVOefoJGm3IGKGvHUulRtTCHl2Yn3v4IL7iwBe/cGL1RAWmQIj5Uc4GgwxW/FggtQPwrPDYfmJM4GPaG1xfrE3e4DT/ydCKVeDIY5bEeBIWU= xiguazhi@DESKTOP-LVO4ICF"
}

// HCP Packer Settings

variable "common_hcp_packer_registry_enabled" {
  type        = bool
  description = "Enable the HCP Packer registry."
  default     = false
}
//  BLOCK: packer
//  The Packer configuration.

packer {
  required_version = "< 2.0.0"
  required_plugins {
    vsphere = {
      version = ">= 1.1.1"
      source = "github.com/hashicorp/vsphere"
    }
    
  }
}


locals {
  iso_paths         = ["[${var.common_iso_datastore}] ${var.iso_path}/${var.iso_file}"]
  iso_checksum      = "${var.iso_checksum_type}:${var.iso_checksum_value}"
  vm_name = format("template-%s",var.vm_guest_os_type)
  data_source_command = "ks=http://{{ .HTTPIP }}: {{ .HTTPPort }}/ks.cfg<enter><wait>"
  build_description = "Built by Brandon Sorenson using Packer."
  manifest_output = "packer-manifest.json"
  data_source_content = {
    "./ks.cfg" = file("http/ks.cfg")
    }
    }
//  BLOCK: source
//  Defines the builder configuration blocks.

source "vsphere-iso" "linux-centos-stream" {

  // vCenter Server Endpoint Settings and Credentials
  username            = var.vsphere_username
  password            = var.vsphere_password
  insecure_connection = var.vsphere_insecure_connection
  vcenter_server = var.vsphere_endpoint
  // vSphere Settings
  datacenter = var.vsphere_datacenter
  host = var.vsphere_host
  resource_pool    = var.vsphere_cluster
  datastore  = var.vsphere_datastore
  folder     = var.vsphere_folder

  // Virtual Machine Settings
  vm_name              = local.vm_name
  guest_os_type        = var.vm_guest_os_type
  firmware             = var.vm_firmware
  CPUs                 = var.vm_cpu_count
  cpu_cores            = var.vm_cpu_cores
  CPU_hot_plug         = var.vm_cpu_hot_add
  RAM                  = var.vm_mem_size
  RAM_hot_plug         = var.vm_mem_hot_add
  cdrom_type           = var.vm_cdrom_type
  disk_controller_type = var.vm_disk_controller_type
  storage {
    disk_size             = var.vm_disk_size
    disk_thin_provisioned = var.vm_disk_thin_provisioned
  }
  network_adapters {
    network      = var.vsphere_network
    network_card = var.vm_network_card
  }
  vm_version           = var.common_vm_version
  remove_cdrom         = var.common_remove_cdrom
  tools_upgrade_policy = var.common_tools_upgrade_policy
  notes                = local.build_description

  // Removable Media Settings
  iso_paths    = local.iso_paths
  iso_checksum = local.iso_checksum
  http_content = var.common_data_source == "http" ? local.data_source_content : null
  cd_content   = var.common_data_source == "disk" ? local.data_source_content : null

  // Boot and Provisioning Settings
  http_ip       = var.common_data_source == "http" ? var.common_http_ip : null
  http_port_min = var.common_data_source == "http" ? var.common_http_port_min : null
  http_port_max = var.common_data_source == "http" ? var.common_http_port_max : null
  boot_order    = var.vm_boot_order
  boot_wait     = var.vm_boot_wait
  boot_command = [
    "<up><wait><tab><wait>text ${local.data_source_command}"
  ]
  ip_wait_timeout  = var.common_ip_wait_timeout
  shutdown_command = "echo '${var.build_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout = var.common_shutdown_timeout

  // Communicator Settings and Credentials
  communicator       = "ssh"
  ssh_proxy_host     = var.communicator_proxy_host
  ssh_proxy_port     = var.communicator_proxy_port
  ssh_proxy_username = var.communicator_proxy_username
  ssh_proxy_password = var.communicator_proxy_password
  ssh_username       = var.build_username
  ssh_password       = var.build_password
  ssh_port           = var.communicator_port
  ssh_timeout        = var.communicator_timeout

  // Template and Content Library Settings
  convert_to_template = var.common_template_conversion
  dynamic "content_library_destination" {
    for_each = var.common_content_library_name != null ? [1] : []
    content {
      library     = var.common_content_library_name
      description = local.build_description
      ovf         = var.common_content_library_ovf
      destroy     = var.common_content_library_destroy
      skip_import = var.common_content_library_skip_export
    }
  }

  // OVF Export Settings
  dynamic "export" {
    for_each = var.common_ovf_export_enabled == true ? [1] : []
    content {
      name  = local.vm_name
      force = var.common_ovf_export_overwrite
      options = [
        "extraconfig"
      ]
      output_directory = local.ovf_export_path
    }
  }
}


//  BLOCK: build
//  Defines the builders to run, provisioners, and post-processors.

build {
  sources = ["source.vsphere-iso.linux-centos-stream"]

  provisioner "ansible" {
    user          = var.build_username
    playbook_file = "${path.cwd}/ansible/playbooks/Provision.yml"
    roles_path    = "${path.cwd}/ansible/roles"
    ansible_env_vars = [
      "ANSIBLE_CONFIG=${path.cwd}/ansible/ansible.cfg"
    ]
    extra_arguments = [
      "--extra-vars", "display_skipped_hosts=false",
      "--extra-vars", "BUILD_USERNAME=${var.build_username}",
      "--extra-vars", "BUILD_SECRET='${var.build_key}'",
      "--extra-vars", "ANSIBLE_USERNAME=${var.ansible_username}",
      "--extra-vars", "ANSIBLE_SECRET='${var.ansible_key}'",
    ]
  }

  post-processor "manifest" {
    output     = local.manifest_output
    strip_path = true
    strip_time = true
    custom_data = {
      ansible_username         = var.ansible_username
      build_username           = var.build_username
      build_date               = local.build_date
      build_version            = local.build_version
      common_data_source       = var.common_data_source
      common_vm_version        = var.common_vm_version
      vm_cpu_cores             = var.vm_cpu_cores
      vm_cpu_count             = var.vm_cpu_count
      vm_disk_size             = var.vm_disk_size
      vm_disk_thin_provisioned = var.vm_disk_thin_provisioned
      vm_firmware              = var.vm_firmware
      vm_guest_os_type         = var.vm_guest_os_type
      vm_mem_size              = var.vm_mem_size
      vm_network_card          = var.vm_network_card
      vsphere_cluster          = var.vsphere_cluster
      vsphere_datacenter       = var.vsphere_datacenter
      vsphere_datastore        = var.vsphere_datastore
      vsphere_endpoint         = var.vsphere_endpoint
      vsphere_folder           = var.vsphere_folder
    }
  }



}