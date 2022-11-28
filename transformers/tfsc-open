#!/usr/bin/bash

echo --------------------- 
echo Остановка слубжы tfsc.service
echo ---------------------
sudo systemctl stop tfsc.service
echo -en '\n'
echo -en '\n'
sleep 5

echo --------------------- 
echo Запуск tmux new-session
echo ---------------------
tmux new-session -d -s tfsc 'cd $HOME/tfsc/ && $HOME/tfsc/tfsc -m'
echo -en '\n'
echo -en '\n'
sleep 2
echo --------------------- 
echo Подключаемся к сессии tmux
echo ---------------------
tmux attach -t tfsc
