#!/bin/sh
#====================================================
#	System Requirement:Debian 8+/Ubuntu 14.04+
#	Author:	eSirPlayground
#	Dscription: OpenWrt Firmware VPS Deployment
#	Version: 0.1
#====================================================
clear
echo "
   ____  ____       _____
  / __ \/ __ \     / ___/___  ______   _____  _____
 / / / / /_/ /_____\__ \/ _ \/ ___/ | / / _ \/ ___/
/ /_/ / ____/_____/__/ /  __/ /   | |/ /  __/ /
\____/_/         /____/\___/_/    |___/\___/_/
"

#Fonts Color
red="\033[31m"
green="\033[32m"
blue="\033[36m"
redBG="\033[41;37m"
none="\033[0m"


#Check System
IS_OPENVZ=
if hostnamectl status | grep -q openvz; then
	IS_OPENVZ=1
fi

if [[ $IS_OPENVZ ]]; then
	echo
	echo -e "你的主机环境为 ${green}OpenVZ${none} ，不支持在此类主机部署，请更换${green}kvm${none}类主机再试"
	exit 0
fi

#Check User
if [ `id -u` -eq 0 ];then
	echo -e "${blue}Checking${none}..."
	echo
else
	echo -e "当前用户不是 ${green}root${none} 用户，请切换到 ${green}root${none} 用户或加上 ${redBG}sudo${none} 后重试"
	echo
	exit 0
fi

#Check Firmware
fwfile="./op.img.gz"
if [ -e $fwfile ];then
	echo -e "${blue}Deploying${none}..."
	echo
	cp ./op.img.gz /
else
	echo -e "请将gz格式的固件改名为${green} op.img.gz ${none}并上传至当前目录，再运行此脚本。"
	exit 0
fi

#File Preparation
#No Checking MD5
vps_kernel=$(uname -r)
wrt_kernel="wrt_kernel.bin"

wget --no-check-certificate https://raw.githubusercontent.com/esirplayground/VPS_OpenWrt/main/$wrt_kernel
cp $wrt_kernel /boot/vmlinuz-$vps_kernel

echo -e "${red}Rebooting${none}..."
reboot