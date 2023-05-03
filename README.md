# **Sorenson Infra**
1. Automate USG Controller Insallation
    a) Create Container and Copy config and SSL cert using LetsEncrypt
    b) Create VPN tunnel to azure cloud
    c) create VPN tunel for NordVPN
    d) create Policy based routing to direct all torrent traffic to NordVPN
2. Create Hub Resoure Group and Set up Site-to-Site VPN to USG Controller on Azure side
    a) Create Teraform modules for creating Site-to-Site VPN
    b) Create Teraform modules for creating Subnets / VNETs
    c) Create Teraform modules for creating Resource Groups and Service Principals
    d) Create Automation for passwor roatation for Service Principals and passwords
3. Create Resource Group for Hashicopr Vault and a couple of small test VMs in azure.
    a) create Ansible role and githu action for Deploying hashicorp vault reource group as well as container
    b) create teraform module for deployment of vault container and storage
    c) See 2d)
## Azure Resources
1. Resource Groups
   1. Hub w/ VNET, DNS, and Site-to-Site
   2. ECR / Docker Container for Ansible Master deploy and Vault
   3. Test group to test new feature additions
2. VNETS
   1. Hub, ECR and Test


Talking to @notsoErudite about Kidology's CONSTANT REJECTION | MrGirl UNFOLLOWS Kidology???
