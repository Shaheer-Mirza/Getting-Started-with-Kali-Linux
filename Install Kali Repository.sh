#!/bin/bash


echo"#Installing Kali Repository."

echo "# See https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/
deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware

# Additional line for source packages
# deb-src http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware



deb https://kali.download/kali/ kali-rolling main contrib non-free non-free-firmware" | \
  sudo tee /etc/apt/sources.list.d/docker.list 


echo"#Kali Repository Installed."
