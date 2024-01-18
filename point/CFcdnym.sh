#!/bin/bash
export LANG=en_US.UTF-8
( [ ! -f pkgupdate ] && $(type -P yum || type -P apt) update -y && touch pkgupdate ) 2> /dev/null >/dev/null
$(type -P yum || type -P apt) install -y lzip unzip qrencode 2> /dev/null | grep -v "already installed" >/dev/null
pkg update -y 2>/dev/null
pkg upgrade -y 2>/dev/null
pkg install wget lzip -y 2>/dev/null
apk add openssh curl wget lzip 2>/dev/null
script_name=$(basename "$BASH_SOURCE")
if [ "$script_name" = "endip.sh" ]; then
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/endip1.sh -o endip1.sh && chmod +x endip1.sh && bash endip1.sh
elif [ "$script_name" = "CFcdnym.sh" ]; then
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/CFcdnym1.sh -o CFcdnym1.sh && chmod +x CFcdnym1.sh && bash CFcdnym1.sh
elif [ "$script_name" = "cfip.sh" ]; then
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/cfip1.sh -o cfip1.sh && chmod +x cfip1.sh && bash cfip1.sh
fi
