#!/bin/bash
if [ $UID = 0 ]; then
	echo "You must not run this as root."
	exit 1
fi
mkdir /tmp/yay && cd /tmp/yay && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
yay -S openssl pulseaudio pavucontrol vim fcitx-mozc fcitx-im fcitx-configtool chromium git openssh os-prober ntfs-3g p7zip virtualbox linux-headers visual-studio-code-bin virtualbox-ext-oracle ghostscript cnijfilter-mg6300 cups gsfonts cups-pdf poppler xsel dosfstools wget --noconfirm
echo -e 'Section "InputClass"\n Identifier "Keyboard Defaults"\n MatchIsKeyboard "yes"\n Option "XKbLayout" "jp"\n EndSection' | sudo tee /etc/X11/xorg.conf.d/10-keyboard.conf > /dev/null
echo -e 'KEYMAP=jp106' | sudo tee  /etc/vconsole.conf > /dev/null
echo -e 'export GTK_IM_MODULE=fcitx\nexport QT_IM_MODULE=fcitx\nexport XMODIFIERS="@im=fcitx"' | sudo tee  ~/.xprofile > /dev/null
git config --global user.name "ksmt4699"
git config --global user.email "ksmt4699@gmail.com"
sudo systemctl start org.cups.cupsd.service
sudo systemctl enable org.cups.cupsd.service
/usr/sbin/lpadmin -p MG6300LAN -m canonmg6300.ppd -v cnijnet:/2C-9E-FC-94-A2-02 -E
