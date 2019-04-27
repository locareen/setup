#!/bin/bash
direcj=(~/ドキュメント ~/ダウンロード ~/デスクトップ ~/ビデオ ~/テンプレート ~/ピクチャ ~/ミュージック ~/公開)
direce=(~/Documents ~/Downloads ~/Desktop ~/Videos ~/Templates ~/Pictures ~/Music ~/Public)
LANG=C xdg-user-dirs-update --force
for i in "${!direcj[@]}";do
    echo "Moving!!" > ${direcj[$i]}/moving
    cp -pR ${direcj[$i]}/* ${direce[$i]}/ && rm -r ${direcj[$i]}
    rm ${direce[$i]}/moving; 
done
