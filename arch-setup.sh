#!/bin/bash
pacman -S openssl pulseaudio pavacontrol vim fcitx-mozc bash-completion chromium git
yay -S visual-studio-code-bin
mkdir /tmp/yay && cd /tmp/yay && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
sudo systemctl start 
git config --global user.name "ksmt4699"
git config --global user.email "ksmt4699@gmail.com"

