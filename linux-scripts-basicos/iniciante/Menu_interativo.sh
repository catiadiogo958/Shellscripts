#!/bin/bash


Ver_data(){
data_atual=` date`
echo "Data atual $data_atual"
}



menu_interativo(){
while  true; do
echo "----------------Menu interativo do utlizador------------"
echo "        Escolha a opcao da tarefa que deseja fazer"
echo "[1].Ver data e hora atual"
echo "[2].Ver Utilizador atual"
echo "[3].Ver Uso do disco"
echo "[4].Ver uso da memoria"
echo "[5].Ver processos em execucao"
echo "[6].Ver ip da maquina"
echo "[7].Limpar o terminal"
echo "[0].Sair"
read -p "Escolha a opcao:" op

case $op in 
1)Ver_data ;;
2)finger ;;
3)df -h ;;
4)free -h ;;
5)ps aux ;;
6)hostname ;;
7)clear ;;
0) echo "A sair..."; exit 0 ;;

esac
done
}
menu_interativo
