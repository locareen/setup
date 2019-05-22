user=$(whoami)
if [ $user == "root" ]; then
   echo "Must not run as root."
   echo "Please run as can use sudo."
   exit 1
fi
direcj=(~/ドキュメント ~/ダウンロード ~/デスクトップ ~/ビデオ ~/テンプレート ~/ピクチャ ~/ミュージック ~/公開)
direce=(~/Documents ~/Downloads ~/Desktop ~/Videos ~/Templates ~/Pictures ~/Music ~/Public)
LANG=C xdg-user-dirs-update --force
for i in "${!direcj[@]}";do
   echo "Moving!!" > ${direcj[$i]}/moving
   cp -pR ${direcj[$i]}/* ${direce[$i]}/ && rm -r ${direcj[$i]}
   rm ${direce[$i]}/moving
done

sudo mkdir /home/share
dir=$(ls /home/share)
dir+=" .vimrc .bashrc"
for i in $dir;do
	ln -fs /home/share/$i ~/$i
done

sudo sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=""/GRUB_CMDLINE_LINUX_DEFAULT="video=SVIDEO-1:d"/' /etc/default/grub
sudo sed -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="clocksource=hpet"/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
