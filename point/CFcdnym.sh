#!/bin/bash
export LANG=en_US.UTF-8
if [ ! -f yg_update ]; then
echo "请稍等……"
if [ -x "$(command -v apt-get)" ]; then
apt update -y >/dev/null 2>&1
apt install lzip unzip qrencode -y >/dev/null 2>&1
elif [ -x "$(command -v yum)" ]; then
yum update -y >/dev/null 2>&1
yum install epel-release -y
yum install lzip unzip qrencode -y
elif [ -x "$(command -v dnf)" ]; then
dnf update -y >/dev/null 2>&1
dnf install lzip unzip qrencode -y >/dev/null 2>&1
fi
echo 1
pkg upgrade -y
pkg install curl wget lzip -y
apk add openssh curl wget lzip
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
