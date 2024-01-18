#!/bin/bash
export LANG=en_US.UTF-8
if [ ! -f yg_update ]; then
echo "请稍等……"
if grep -qi "alpine" /etc/os-release; then
apk add openssh curl wget lzip
elif [ -x "$(command -v apt-get)" ]; then
apt update -y
apt install lzip unzip qrencode -y
elif [ -x "$(command -v yum)" ]; then
vsid=$(grep -i version_id /etc/os-release 2>/dev/null | cut -d \" -f2 | cut -d . -f1)
if [[ ${vsid} =~ 8 ]]; then
cd /etc/yum.repos.d/ && mkdir backup && mv *repo backup/ 
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo
sed -i -e "s|mirrors.cloud.aliyuncs.com|mirrors.aliyun.com|g " /etc/yum.repos.d/CentOS-*
sed -i -e "s|releasever|releasever-stream|g" /etc/yum.repos.d/CentOS-*
yum clean all && yum makecache
cd
fi
yum update -y
yum install epel-release -y
yum install lzip unzip qrencode -y
elif [ -x "$(command -v dnf)" ]; then
dnf update -y
dnf install lzip unzip qrencode -y 
else
pkg install curl 
pkg install wget
pkg install lzip
pkg update
fi
touch yg_update
fi
script_name=$(basename "$BASH_SOURCE")
if [ "$script_name" = "endip.sh" ]; then
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/endip1.sh -o endip1.sh && chmod +x endip1.sh && bash endip1.sh
elif [ "$script_name" = "CFcdnym.sh" ]; then
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/CFcdnym1.sh -o CFcdnym1.sh && chmod +x CFcdnym1.sh && bash CFcdnym1.sh
elif [ "$script_name" = "cfip.sh" ]; then
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/cfip1.sh -o cfip1.sh && chmod +x cfip1.sh && bash cfip1.sh
fi
