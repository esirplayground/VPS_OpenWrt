# VPS_OpenWrt
![GitHub Stars](https://img.shields.io/github/stars/esirplayground/VPS_OpenWrt.svg?style=flat&logo=appveyor&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/esirplayground/VPS_OpenWrt.svg?style=flat&logo=appveyor&label=Forks&logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/esirplayground/VPS_OpenWrt?label=Latest%20Commit&logo=github)

This repo helps to deploy OpenWrt onto your VPS.<br>
Youtube video tutorial(in Mandarin): https://youtu.be/iXhd-h4aVW8

**Prerequisite**
 - **`Ubuntu`** or **`Debian`** (CentOS/ArchBase Not tested)
 - **`wget`** installed<br>
   probably you don't need this, but if you do, you could run command below to install `wget`:<br>
   `apt update && apt install -y wget` 

**Steps**

1.  Upload OpenWrt firmware(WinSCP or prefer), rename it to `op.img.gz` 
2.  Run: `bash -c "$(wget -O- https://git.io/JGvno)"`
 
**Support Platform :**
- Google Cloud
- Azure
- Vultr
- Virmach
- Racknerd
- Hostdare
- Ali Cloud (Domestic)
- ...

**`NOT` Support Platform :**
- ...
