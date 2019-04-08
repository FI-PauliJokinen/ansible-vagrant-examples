# Ansible Vagrant profile for Gogs

## Background

Vagrant and VirtualBox (or some other VM provider) can be used to quickly build or rebuild virtual servers.

This Vagrant profile installs [Gogs](https://github.com/gogits/gogs) using the [Ansible](http://www.ansible.com/) provisioner.

## Getting Started

This README file is inside a folder that contains a `Vagrantfile` (hereafter this folder shall be called the [vagrant_root]), which tells Vagrant how to set up your virtual machine in VirtualBox.

To use the vagrant file, you will need to have done the following:

  1. Download and Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  2. Download and Install [Vagrant](https://www.vagrantup.com/downloads.html)
optional: install vagrant cachier to speed up vagrant provisioner (e.g. Ansible) related development 
```
vagrant plugin install vagrant-cachier
```
  3. Install [Ansible](https://www.ansible.com/) ([guide for installing Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html))
  4. Open a shell prompt (Terminal app on a Mac) and cd into the folder containing the `Vagrantfile`
  5. Run the following command to install the necessary Ansible roles for this profile: `$ ansible-galaxy install -r requirements.yml`

e.g.
```
user@users-Air:(master) ~/git/ansible-vagrant-examples/gogs
>cat requirements.yml
---
- src: geerlingguy.firewall
- src: geerlingguy.ntp
- src: geerlingguy.git
- src: geerlingguy.mysql
- src: geerlingguy.gogs

user@users-Air:(master) ~/git/ansible-vagrant-examples/gogs
>ansible-galaxy install geerlingguy.firewall
- downloading role 'firewall', owned by geerlingguy
- downloading role from https://github.com/geerlingguy/ansible-role-firewall/archive/2.4.1.tar.gz
- extracting geerlingguy.firewall to /Users/user/.ansible/roles/geerlingguy.firewall
- geerlingguy.firewall (2.4.1) was installed successfully
user@users-Air:(master) ~/git/ansible-vagrant-examples/gogs
>ansible-galaxy install geerlingguy.ntp
- downloading role 'ntp', owned by geerlingguy
- downloading role from https://github.com/geerlingguy/ansible-role-ntp/archive/1.6.2.tar.gz
- extracting geerlingguy.ntp to /Users/user/.ansible/roles/geerlingguy.ntp
- geerlingguy.ntp (1.6.2) was installed successfully
user@users-Air:(master) ~/git/ansible-vagrant-examples/gogs
>ansible-galaxy install geerlingguy.git
- downloading role 'git', owned by geerlingguy
- downloading role from https://github.com/geerlingguy/ansible-role-git/archive/2.0.4.tar.gz
- extracting geerlingguy.git to /Users/user/.ansible/roles/geerlingguy.git
- geerlingguy.git (2.0.4) was installed successfully
user@users-Air:(master) ~/git/ansible-vagrant-examples/gogs
>ansible-galaxy install geerlingguy.mysql
- downloading role 'mysql', owned by geerlingguy
- downloading role from https://github.com/geerlingguy/ansible-role-mysql/archive/2.9.4.tar.gz
- extracting geerlingguy.mysql to /Users/user/.ansible/roles/geerlingguy.mysql
- geerlingguy.mysql (2.9.4) was installed successfully
user@users-Air:(master) ~/git/ansible-vagrant-examples/gogs
>ansible-galaxy install geerlingguy.gogs
- downloading role 'gogs', owned by geerlingguy
- downloading role from https://github.com/geerlingguy/ansible-role-gogs/archive/1.4.2.tar.gz
- extracting geerlingguy.gogs to /Users/user/.ansible/roles/geerlingguy.gogs
- geerlingguy.gogs (1.4.2) was installed successfully
 [WARNING]: - dependency geerlingguy.git from role geerlingguy.gogs differs from already installed version (2.0.4),
skipping
```

Once all of that is done, you can simply type in `vagrant up`, and Vagrant will create a new VM, install the base box, and configure it.

Once the new VM is up and running (after `vagrant up` is complete and you're back at the command prompt), you can log into it via SSH if you'd like by typing in `vagrant ssh`. Otherwise, the next steps are below.

### Setting up your hosts file

You need to modify your host machine's hosts file (Mac/Linux: `/etc/hosts`; Windows: `%systemroot%\system32\drivers\etc\hosts`), adding the line below:

    192.168.33.23  gogs

(Where `gogs`) is the hostname you have configured in the `Vagrantfile`).

After that is configured, you could visit `http://gogs:3000/install` in a browser, and you'll see the Gogs installation page. The MySQL root user account's password (configured in `provisioning/vars/main.yml`) is `root`.

You will need to configure gogs URL (localhost:3000) to point to:
```
gogs:3000
```

If you'd like additional assistance editing your hosts file, please read [How do I modify my hosts file?](http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file) from Rackspace.

## Author Information

Created in 2014 by [Jeff Geerling](https://www.jeffgeerling.com/), author of [Ansible for DevOps](https://www.ansiblefordevops.com/).
