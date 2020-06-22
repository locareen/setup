#! /bin/bash
#rootチェック
if [ $UID != 0 ]; then
        echo "You must run this as root."
        exit 1
fi
apt-get update &&  apt-get -y upgrade
#fcitx-Mozc導入
apt-get install -y fcitx fcitx-mozc mozc-utils-gui
#Virtualboxリポジトリ追加
sh -c 'echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib" > /etc/apt/sources.list.d/virtualbox.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- |  apt-key add  -
#GIMP2.8削除
apt-get purge -y gimp
#インストール
apt update
apt-get install -y xterm
apt-get install -y git
apt-get install -y vim
apt-get install -y virtualbox-6.0
apt-get install -y filezilla
apt-get install -y winehq-stable
apt-get install -y brasero
apt-get install -y timeshift
apt-get install -y plank
#mozc-ut2導入
#systemctl start docker
#docker run -d --name mozc-ut2 shufo/mozc-ut2:bionic
#docker cp mozc-ut2:/app/ ./deb/
#docker rm mozc-ut2
mkdir /tmp/mozc-ut2 && cd /tmp/mozc-ut2
wget "https://drive.google.com/uc?export=download&id=1XQvIEktTZ1d9ENsVL8daI8zXYBpCvIsc"
tar xfv "uc?export=download&id=1XQvIEktTZ1d9ENsVL8daI8zXYBpCvIsc"
dpkg -i ./mozc-data_*.deb ./mozc-server_*.deb ./mozc-utils-gui_*.deb ./fcitx-mozc_*.deb
cd ../
rm -r mozc-ut2
#QCMA導入
mkdir /tmp/qcma
cd /tmp/qcma
wget http://download.opensuse.org/repositories/home:/codestation/xUbuntu_18.04/amd64/libvitamtp5_2.5.9_amd64.deb
wget http://download.opensuse.org/repositories/home:/codestation/xUbuntu_18.04/amd64/qcma-cli_0.4.2_amd64.deb
wget http://download.opensuse.org/repositories/home:/codestation/xUbuntu_18.04/amd64/qcma_0.4.2_amd64.deb
dpkg -i ./*
rm -r /tmp/qcma
#Tear解消
mkdir /etc/X11/xorg.conf.d
echo -e 'Section "Device"\n   Identifier  "Intel Graphics"\n   Driver      "intel"\n   Option      "TearFree"    "true"\nEndSection' |  tee /etc/X11/xorg.conf.d/20-intel.conf > /dev/null
#GenShinGothicの導入
mkdir /tmp/gsg && cd /tmp/gsg
wget -q https://osdn.jp/downloads/users/8/8634/genshingothic-20150607.7z
7z x *.7z
mkdir /usr/share/fonts/truetype/GenShinGothic
name="GenShinGothic"
for i in "$name-ExtraLight.ttf" "$name-Light.ttf" "$name-Normal.ttf" "$name-Bold.ttf" "$name-Heavy.ttf"; do
	mv $i /usr/share/fonts/truetype/GenShinGothic/
done

name="GenShinGothic-Monospace"
for i in "$name-ExtraLight.ttf" "$name-Light.ttf" "$name-Normal.ttf" "$name-Bold.ttf" "$name-Heavy.ttf"; do
        mv $i /usr/share/fonts/truetype/GenShinGothic/
done

fc-cache -fv
#blueman削除
apt-get purge -y blueman
apt-get purge -y cario-dock
apt-get autoremove
