#!/bin/bash
echo "---------------------"
echo "Начинаем обновление"
echo "---------------------"
sleep 1
echo "----------------------------------------------------"
echo "Переходим переходим в директорию <~/pathfinder/py>"
echo "----------------------------------------------------"
sleep 1

cd ~/pathfinder/py

echo "------------------------------------------"
echo "Находимся в директории <~/pathfinder/py>"
echo "------------------------------------------"
sleep 1
echo "------------------------------------------"
echo "Находимся в директории <~/pathfinder/py>"
echo "------------------------------------------"
sleep 1
echo "-----------------------------------------------------------------------------"
echo "Начинаем скачивать с github, выполняем загрузку содержимого из удаленного репозитория"
echo "-----------------------------------------------------------------------------"
sleep 1

git fetch

echo "-----------------------------------------------------"
echo "Загрузка выполнена, выполняем обновление репозитория"
echo "-----------------------------------------------------"
sleep 1

git checkout v0.4.5

echo "----------------------------------------------"
echo "Репозиторий успешно обновлен, начинаем зборку"
echo "----------------------------------------------"

python3 -m venv .venv
source .venv/bin/activate
PIP_REQUIRE_VIRTUALENV=true pip install --upgrade pip
PIP_REQUIRE_VIRTUALENV=true pip install -r requirements-dev.txt
rustup update
cargo build --release --bin pathfinder
source $HOME/.bash_profile

echo "-----------------------"
echo "Билд завершен"
echo "-----------------------"
sleep 1

sudo systemctl restart starknet

echo "-----------------------"
echo "Нода перезагружена"
echo "-----------------------"
sleep 1

sudo journalctl -n 100 -f -u starknet.service
