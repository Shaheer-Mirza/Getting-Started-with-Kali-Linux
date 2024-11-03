export distro=bookworm

sudo curl https://repo.waydro.id/waydroid.gpg --output /usr/share/keyrings/waydroid.gpg
echo "deb [signed-by=/usr/share/keyrings/waydroid.gpg] https://repo.waydro.id/ ${distro} main" | \
  sudo tee /etc/apt/sources.list.d/waydroid.list

sudo apt update
sudo apt install -y \
  build-essential cdbs devscripts equivs fakeroot \
  git git-buildpackage git-lfs \
  libgbinder-dev

sudo wget https://raw.githubusercontent.com/MrCyjaneK/waydroid-build/main/build_changelog \
  -O /usr/bin/build_changelog
sudo chmod +x ${_}

mkdir ~/build-packages
cd ${_}
git clone https://github.com/waydroid/gbinder-python.git
cd gbinder-python
build_changelog
sudo mk-build-deps -ir -t "apt -o Debug::pkgProblemResolver=yes -y --no-install-recommends"
sudo debuild -b -uc -us
sudo apt install -f -y ../*.deb

# sudo apt remove libgbinder-dev gbinder-python-build-deps git-lfs fakeroot equivs devscripts cdbs
# you can remove git and build-essential packages too
sudo apt autoremove -y
sudo rm /usr/bin/build_changelog

sudo apt install waydroid -y

sudo mkdir -p /usr/share/waydroid-extra/images