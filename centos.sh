#!/bin/bash


# 禁用selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# 修改系统时区
timedatectl set-timezone Asia/Shanghai

# 安装常用工具
yum install -y wget curl vim git unzip epel-release nginx

systemctl start nginx

# 安装Node.js和npm
# curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
# yum install -y nodejs

# 安装Docker
yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
# 启动并设置Docker开机自启
systemctl start docker
systemctl enable docker
systemctl enable nginx
#安装docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
