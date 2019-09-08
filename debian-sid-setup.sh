#! /bin/bash
#rootチェック
if [ $UID != 0 ]; then
        echo "You must run this as root."
        exit 1
fi
mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo "deb http://ftp.yz.yamagata-u.ac.jp/debian/ buster main non-free contrib" > /etc/apt/sources.list
echo "deb-src http://ftp.yz.yamagata-u.ac.jp/debian/ buster main non-free contrib" >> /etc/apt/sources.list
apt-get update &&  apt-get -y upgrade
#visual studio codeリポジトリ追加
apt-get install -u curl apt-transport-https gpg
apt-get install -y curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
#インストール
apt-get update
apt-get install -y fcitx fcitx-mozc mozc-utils-gui wget xterm git vim code p7zip
#mozc-ut2導入
mkdir /tmp/mozc-ut2 && cd /tmp/mozc-ut2
wget "https://drive.google.com/uc?export=download&id=1XQvIEktTZ1d9ENsVL8daI8zXYBpCvIsc"
tar xfv "uc?export=download&id=1XQvIEktTZ1d9ENsVL8daI8zXYBpCvIsc"
dpkg -i ./mozc-data_*.deb ./mozc-server_*.deb ./mozc-utils-gui_*.deb ./fcitx-mozc_*.deb
cd ../
rm -r mozc-ut2
apt-get autoremove
