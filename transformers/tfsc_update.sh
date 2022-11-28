#!/bin/bash
echo "Сначала скопируйте и вставьте ссылку на бинарный фаил для скачивания,  создайте переменную."
echo "link_tfsc=ссылка на бинарный фаид"
sleap 10
echo $link_tfsc
sleap 10

echo "Завершение сессии tmux tfsc"
tmux kill-session -t tfsc
sleap 2

echo "Остановка сервисного фала"
sudo systemctl stop tfsc.service
sleap 2

echo "Удаление бинарного файла tfsc"
rm -rf $HOME/tfsc/tfsc
sleap 2

echo "Скачивание бинарного файла"
cd $HOME/tfsc/
wget -O $HOME/tfsc/tfsc $link_tfsc
sleap 10

echo "Права на исполнение бинарного файла tfsc"
chmod +x $HOME/tfsc/tfsc
sleap 2

echo "Запуск сервисного файла"
sudo systemctl start tfsc.service
sleap 2

echo "Запуск логов"
journalctl -n 100 -f -u tfsc.service
