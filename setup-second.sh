#!/bin/bash
if [ $UID != 0 ]; then
  echo "error!"
  exit 1
fi

#Tear解消
#mkdir /etc/X11/xorg.conf.d
#echo -e 'Section "Device"\n   Identifier  "Intel Graphics"\n   Driver      "intel"\n   Option      "TearFree"    "true"\nEndSection' |  tee /etc/X11/xorg.conf.d/20-intel.conf > /dev/null
#GenShinGothicの導入
mkdir /tmp/gsg || rm -r /tmp/gsg && cd /tmp/gsg
wget https://osdn.jp/downloads/users/8/8634/genshingothic-20150607.7z
7zr x *.7z
mkdir -p /usr/share/fonts/truetype/GenShinGothic
name="GenShinGothic"
for i in "$name-ExtraLight.ttf" "$name-Light.ttf" "$name-Normal.ttf" "$name-Bold.ttf" "$name-Heavy.ttf"; do
	mv $i /usr/share/fonts/truetype/GenShinGothic/
done

name="GenShinGothic-Monospace"
for i in "$name-ExtraLight.ttf" "$name-Light.ttf" "$name-Normal.ttf" "$name-Bold.ttf" "$name-Heavy.ttf"; do
        mv $i /usr/share/fonts/truetype/GenShinGothic/
done

fc-cache -fv
