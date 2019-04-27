#! /bin/sh
sudo apt-get update && sudo apt-get -y upgrade
#ディレクトリ英語化
./eng-home-dir.sh
#fcitx-Mozc導入
sudo apt-get install -y fcitx fcitx-mozc mozc-utils-gui
#VSCodeリポジトリ追加
sudo apt-get install -y curl
sudo apt-get install -y apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
#Chromeリポジトリ追加
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list' 
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#Virtualboxリポジトリ追加
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add  -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add  -
#Dockerリポジトリ追加
agi apt-transport-https ca-certificates
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
#GIMP2.8削除
sudo apt-get purge -y gimp
#Snapd追加
sudo apt-get install spapd
#インストール
sudo apt update
sudo apt-get install -y google-chrome-stable
sudo apt-get install -y git
sudo apt-get install -y code
sudo apt-get install -y vim
sudo apt-get install -y virtualbox
sudo apt-get install -y filezilla
sudo apt-get install -y wine64
sudo apt-get install -y winetricks
winetricks allfonts
sudo curl -o /usr/share/applications/wine.desktop https://raw.githubusercontent.com/wine-mirror/wine/5c2d6211f6590d3856dc9188593b3d3597c8b441/loader/wine.desktop
sudo apt-get install -y docker-ce
sudo apt-get install -y brasero
sudo apt-get install -y fileziilla
sudo snap install gimp
#Mozc辞書強化
sudo systemctl start docker
sudo docker run -d --name mozc-ut2 shufo/mozc-ut2:bionic
sudo docker cp mozc-ut2:/app/ ./deb/
sudo docker rm mozc-ut2
cd ./deb
sudo dpkg -i ./mozc-data_*.deb ./mozc-server_*.deb ./mozc-utils-gui_*.deb ./fcitx-mozc_*.deb
cd ../
rm -r ./deb
#QCMA導入
mkdir /tmp/qcma
cd /tmp/qcma
wget http://download.opensuse.org/repositories/home:/codestation/xUbuntu_18.04/amd64/libvitamtp5_2.5.9_amd64.deb
wget http://download.opensuse.org/repositories/home:/codestation/xUbuntu_18.04/amd64/qcma-cli_0.4.2_amd64.deb
wget http://download.opensuse.org/repositories/home:/codestation/xUbuntu_18.04/amd64/qcma_0.4.2_amd64.deb
sudo dpkg -i ./*

sudo apt-get purge -y blueman
sudo apt-get autoremove
