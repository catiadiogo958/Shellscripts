#!/bin/bash

#menu principal que sera executado na tela
Menu_principal(){
 clear
  while true; do
    echo "|---------------------------------------------------|"
    echo "|      =====MENu ADMINISTRATIVO DO SISTEMA=====     |"
    echo "|---------------------------------------------------|"
    echo "| [1]. Gestao de Espaco em Disco                    |"
    echo "| [2]. Gestao de Utilizadores do Sistema            |"
    echo "| [3]. Monitoramento em Tempo Real                  |"
    echo "| [4]. Gestao de Rede                               |"
    echo "| [5]. Gestao de Servico			      |"
    echo "| [6]. Seguranca do Sistema			      |"
    echo "| [0]. Sair                                         |"
    echo "|---------------------------------------------------|"
    read -p "Escolha a opcao: " op

case $op in
0) "A sair do Sistema..."; exit 0 ;;



}











#Aqui estao as funcoes para o menu principal 

gestao_utilizadores() {
  clear
  while true; do
    echo "|---------------------------------------------------|"
    echo "|   =====MENU GERENCIAMENTO DE UTILIZADORES=====    |"
    echo "|---------------------------------------------------|"
    echo "| [1]. Listar utilizadores do sistema               |"
    echo "| [2]. Ver utilizadores ligados                     |"
    echo "| [3]. Ver ultimo login de cada utilizador          |"
    echo "| [4]. Ver tentativas de login falhadas             |"
    echo "| [0]. Voltar                                       |"
    echo "|---------------------------------------------------|"
    read -p "Escolha a opcao: " op
    case $op in
      1) whoami ;;
      2) who ;;
      3) last ;;
      4) lastb ;;
      0) Menu_principal ;;
      *) echo "Opcao invalida!" ;;
    esac
    sleep 2
  done
}

gestao_disco() {
  while true; do
    clear
    echo "|-------------------------------------------------|"
    echo "|           ====MENU GESTAO DE DISCO====          |"
    echo "|-------------------------------------------------|"
    echo "| [1]. Ver uso total do disco                     |"
    echo "| [2]. Ver pastas que ocupam mais espaco          |"
    echo "| [3]. Limpar ficheiros temporarios               |"
    echo "| [4]. Ver ficheiros maiores que 100MB            |"
    echo "| [0]. Voltar                                     |"
    echo "|-------------------------------------------------|"
    read -p "Insira a opcao: " op
    case $op in
      1) df -h ;;
      2) du -h --max-depth=1 | sort -rh | head -10 ;;
      3) rm -rf /tmp/* && echo "Ficheiros temporarios limpos!" ;;
      4) find / -size +100M -type f 2>/dev/null ;;
      0) menu_admin ;;
      *) echo "Opcao invalida!" ;;
    esac
    sleep 2
  done
}

monitora_tempo_real() {
  while true; do
    clear
    echo "|-------------------------------------------------|"
    echo "|     ===Monitorizacao em Tempo Real===           |"
    echo "|-------------------------------------------------|"
    echo "| [1]. Ver CPU em uso agora                       |"
    echo "| [2]. Ver memoria disponivel                     |"
    echo "| [3]. Ver 5 processos que consomem mais CPU      |"
    echo "| [4]. Ver 5 processos que consomem mais memoria  |"
    echo "| [0]. Voltar                                     |"
    echo "|-------------------------------------------------|"
    read -p "Insira a opcao: " op
    case $op in
      1) top -bn1 | grep "Cpu" ;;
      2) free -h ;;
      3) ps aux --sort=-%cpu | head -6 ;;
      4) ps aux --sort=-%mem | head -6 ;;
      0) menu_admin ;;
      *) echo "Opcao invalida!" ;;
    esac
    sleep 2
  done
}



Menu_principal
