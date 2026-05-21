#!/bin/bash

clear
Ver_data(){
data_atual=` date`
echo "Data atual $data_atual"
}



menu_interativo(){
while  true; do

echo "----------------Menu interativo do utlizador------------"
echo "        Escolha a opcao da tarefa que deseja fazer"
echo "[1].Ver Data e hora Atual"
echo "[2].Ver Utilizador Atual"
echo "[3].Ver Uso do Disco"
echo "[4].Ver Uso da Memoria"
echo "[5].Ver Processos em Execucao"
echo "[6].Ver Ip da Maquina"
echo "[7].Limpar o terminal"
echo "[0].Sair"
read -p "Escolha a opcao:" op

case $op in 
1)Ver_data ;; 


2)whoami ;; 
3)df -h ;;
4)free -h ;;
5)ps aux ;;
6)hostname -I ;;
7)clear ;;
0) echo "A sair..."; exit 0 ;;

esac
done
}
menu_interativo
