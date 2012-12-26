# KVM 

## DESCRIPTION

Install KVM Hypervisor on Ubuntu, Debian, CentOS or RHEL

## REQUIREMENTS

### OS

* Ubuntu (tested)
* Debian
* CentOS (tested host)
* RHEL

### Cookbooks

* sysctl : https://github.com/Youscribe/sysctl-cookbook
* modules : https://github.com/Youscribe/modules-cookbook

## USAGE

### Default recipe

Detect the server role from OHAI : host or guest. And install minimum packages.
For security, the default recipe doesn't install a kvm server, you need to install it with kvm::host

### host recipe

Install minimum packages and configuration to do kvm virtualization.

### guest recipe

Install minimum packages and configuration for a kvm guest.

### host-tuning recipe

Install packages and configuration to enhance your kvm host.

### guest-tuning recipe

Install packages and configuration to enhance your kvm guest.
