#!/bin/bash
export LANG=en_US.UTF-8
if [ ! -f yg_update ]; then
echo "请稍等……"
if [ -e "/etc/os-release" ] && grep -qi "alpine" /etc/os-release; then
apk add openssh curl wget lzip
else
pkg install curl 2>/dev/null
pkg install wget 2>/dev/null
pkg install lzip 2>/dev/null
pkg update 2>/dev/null
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
