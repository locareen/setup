#!/bin/bash
mkdir /tmp/yay && cd /tmp/yay && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -S openssl pulseaudio pavacontrol vim fcitx-mozc bash-completion chromium git visual-studio-code-bin virtualbox linux-headers
git config --global user.name "ksmt4699"
git config --global user.email "ksmt4699@gmail.com"
