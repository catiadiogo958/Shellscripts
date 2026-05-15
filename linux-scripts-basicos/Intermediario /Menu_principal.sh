#!/bin/bash

source ./Login_user.sh

menu_principal(){
    while true; do
        clear
        echo "-----------------------------------"
        echo "   Super Mercado Catolica Market"
        echo "         Login Funcionarios"
        echo "-----------------------------------"
        echo ""
    echo "  [1] Login como Admin"
    echo "  [2] Login como Gerente"
    echo "  [3] Login como Operador de Caixa"
    echo "  [0] Sair"
    echo ""
        echo -n "Opcao: "
        read escolher_opcoes

        case $escolher_opcoes in
            1) registar_log "Acedeu como Gerente";login_admin ;;
            2) registar_log "Acedeu como Caixa"; login_gerente ;;
            3) registar_log "Acedeu como Admin"; login_caixa ;;
            4) login_log ;;
            0) echo "Saindo..."; exit 0 ;;
            *) echo "Opcao invalida!"; sleep 1 ;;
        esac
    done
}

menu_principal
