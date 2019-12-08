#!/bin/bash

# VM Setting 
# 1. CPU : 4core, vt-x on
# 2. Mem : 7000 MB
# 3. Disk : 25 GB
# 4. ubuntu-18.04.3-desktop-amd64.iso
# 5. vnc : on (Optional)

# OS Install
# 1. Language : Ko
# 2. Install Option : Minimal
# 3. Computer Name : u1

sudo -i 

# Install Basic Software
apt update -y
apt upgrade -y
apt install -y openssh-server 

#--------------
apt install -y net-tools tree curl git nfs-kernel-server apt-transport-https ca-certificates software-properties-common ansible


# Enviroment Setting
update-alternatives --set editor /usr/bin/vim.tiny

chmod 740 /etc/sudoers
echo "ubuntu  ALL=(ALL)     NOPASSWD: ALL" >> /etc/sudoers
chmod 440 /etc/sudoers




# VirtualBox and Vagrant Install
apt install -y virtualbox

wget https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb
dpkg -i vagrant_2.2.6_x86_64.deb
vagrant plugin install vagrant-vbguest
su - ubuntu vagrant box list
su - ubuntu vagrant box add centos/7


# Install Terraform
wget https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip
unzip terraform_0.12.17_linux_amd64.zip
mv terraform /usr/bin/


# Docker Install
export DEBIAN_FRONTEND=noninteractive
locale-gen ko_KR.UTF-8


apt-get  install \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update -y

apt-get install docker-ce -y
apt-cache madison docker-ce

docker run -it --rm hello-world

usermod -aG docker ubuntu
chown -R root:docker /var/run/docker.sock
chmod 777 /var/run/docker.sock

# Source Install
su - ubuntu 
git clone https://github.com/Finfra/prometheus-course.git

git clone https://github.com/Finfra/spark_quickstart.git
cd spark_quickstart
./doAll.sh

# docker Image pull
docker pull fpin/docker-hive-spark
docker pull prom/prometheus
exit