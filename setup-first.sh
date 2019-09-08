user=$(whoami)
if [ $user == "root" ]; then
   echo "Must not run as root."
   echo "Please run as can use sudo."
   exit 1
fi

sudo sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=""/GRUB_CMDLINE_LINUX_DEFAULT="video=SVIDEO-1:d"/' /etc/default/grub
sudo sed -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="clocksource=hpet"/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
