#!/bin/bash

#ТРЕБУЕТ ДОРАБОТКИ ИЛИ ВСТАВЛЯТЬ ССЫЛКУ В СКРИПТ

#echo "Сначала скопируйте и вставьте ссылку на бинарный фаил для скачивания,  создайте переменную."
#echo "link_tfsc=ссылка на бинарный фаид"
#echo -en '\n'
#sleep 10

#echo -en '\n'
#echo $link_tfsc
#sleep 10

#echo -en '\n'
echo "Завершение сессии tmux tfsc"
tmux kill-session -t tfsc
sleep 2

echo -en '\n'
echo "Остановка сервисного фала"
sudo systemctl stop tfsc.service
sleep 2

echo -en '\n'
echo "Удаление бинарного файла tfsc"
rm -rf $HOME/tfsc/tfsc
sleep 2

echo -en '\n'
echo "Скачивание бинарного файла"
wget -O $HOME/tfsc/tfsc https://fastcdn.uscloudmedia.com/transformers/test/tfs_v0.19.0_000aec2_devnet
sleep 10

echo -en '\n'
echo "Права на исполнение бинарного файла tfsc"
chmod +x $HOME/tfsc/tfsc
sleep 2

echo -en '\n'
echo "Запуск сервисного файла"
sudo systemctl start tfsc.service
sleep 2

echo -en '\n'
echo "Запуск логов"
journalctl -n 100 -f -u tfsc.service
