#!/bin/bash
if [ $uid = 0 ]; then
	echo "You must not run this as root."
	exit 1
fi
sudo pacman -S openssl pulseaudio pavucontrol vim fcitx-mozc bash-completion chromium git xf86-video-intel os-prober p7zip
yay -S visual-studio-code-bin update-grub
echo -e 'Section "InputClass"\n Identifier "Keyboard Defaults"\n MatchIsKeyboard "yes"\n Option "XKbLayout" "jp"\n End Section' | sudo tee /etc/X11/xorg.conf.d/10-keyboard.conf > /dev/null
echo -e 'KEYMAP=jp106' | sudo tee  /etc/vconsole.conf > /dev/null
echo -e 'export GTK_IM_MODULE=fcitx\n export QT_IM_MODULE=fcitx\n export XMODIFIERS=" @im=fcitx"' | sudo tee  ~/.xprofile > /dev/null
