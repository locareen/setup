#! /bin/bash
#rootチェック
if [ $UID != 0 ]; then
        echo "You must run this as root."
        exit 1
fi
apt-get update &&  apt-get -y upgrade
#visual studio codeリポジトリ追加
apt install curl
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
#qcmaリポジトリ追加
echo 'deb http://download.opensuse.org/repositories/home:/codestation/Debian_9.0/ /' > /etc/apt/sources.list.d/home:codestation.list
wget -nv https://download.opensuse.org/repositories/home:codestation/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key

#インストール
apt-get update
apt-get install -y fcitx fcitx-mozc mozc-utils-gui
apt-get install -y xterm
apt-get install -y git
apt-get install -y vim
apt-get install -y code
apt-get install -y virtualbox
apt-get install -y filezilla
apt-get install -y brasero
apt-get install -y timeshift
apt-get install -y plank
apt-get install -y p7zip
apt-get install -y qcma
#mozc-ut2導入
mkdir /tmp/mozc-ut2 && cd /tmp/mozc-ut2
wget "https://drive.google.com/uc?export=download&id=1XQvIEktTZ1d9ENsVL8daI8zXYBpCvIsc"
tar xfv "uc?export=download&id=1XQvIEktTZ1d9ENsVL8daI8zXYBpCvIsc"
dpkg -i ./mozc-data_*.deb ./mozc-server_*.deb ./mozc-utils-gui_*.deb ./fcitx-mozc_*.deb
cd ../
rm -r mozc-ut2
apt-get autoremove
