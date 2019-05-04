#! /bin/bash
#rootチェック
if [ $UID != 0 ]; then
        echo "You must run this as root."
        exit 1
fi
apt-get update &&  apt-get -y upgrade
#ディレクトリ英語化
./eng-home-dir.sh
#fcitx-Mozc導入
apt-get install -y fcitx fcitx-mozc mozc-utils-gui
#VSCodeリポジトリ追加
apt-get install -y curl
apt-get install -y apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm microsoft.gpg
#Virtualboxリポジトリ追加
sh -c 'echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib" > /etc/apt/sources.list.d/virtualbox.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- |  apt-key add  -
#Dockerリポジトリ追加
agi apt-transport-https ca-certificates
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
#GIMP2.8削除
apt-get purge -y gimp
#Snapd追加
apt-get install spapd
#Wineリポジトリ追加
dpkg --add-architecture i386
sh -c 'echo "deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main" > /etc/apt/sources.list.d/winehq.list'
wget -q https://dl.winehq.org/wine-builds/winehq.key
apt-key add winehq.key
rm winehq.key
#インストール
apt update
apt-get install -y xterm
apt-get install -y git
apt-get install -y code
apt-get install -y vim
apt-get install -y virtualbox-6.0
apt-get install -y filezilla
apt-get install -y winehq-stable
apt-get install -y docker-ce
apt-get install -y cabextract
apt-get install -y brasero
snap install gimp
#Wine後処理
cd "/usr/bin"
wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
winetricks allfonts
curl -o /usr/share/applications/wine.desktop https://raw.githubusercontent.com/wine-mirror/wine/5c2d6211f6590d3856dc9188593b3d3597c8b441/loader/wine.desktop
#Mozc辞書強化
systemctl start docker
docker run -d --name mozc-ut2 shufo/mozc-ut2:bionic
docker cp mozc-ut2:/app/ ./deb/
docker rm mozc-ut2
cd ./deb
dpkg -i ./mozc-data_*.deb ./mozc-server_*.deb ./mozc-utils-gui_*.deb ./fcitx-mozc_*.deb
cd ../
rm -r ./deb
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

name="GenShinGothic-monospace"
for i in "$name-ExtraLight.ttf" "$name-Light.ttf" "$name-Normal.ttf" "$name-Bold.ttf" "$name-Heavy.ttf"; do
        mv $i /usr/share/fonts/truetype/GenShinGothic/
done

fc-cache -fv
#blueman削除
apt-get purge -y blueman

apt-get autoremove
