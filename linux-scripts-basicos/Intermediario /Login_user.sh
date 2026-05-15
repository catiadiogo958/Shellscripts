#!/bin/bash

# ============================================================
#   SISTEMA DE LOGIN - Admin, Gerente, Caixa
# ============================================================

# ── Credenciais ──────────────────────────────────────────────
ADMIN_FILE="User_Admin.csv"
GERENTE_FILE="User_Gerente.csv"
CAIXA_FILE="User_Caixa.csv"

MAX_TENTATIVAS=3

# ── Cores ────────────────────────────────────────────────────
VERDE="\033[0;32m"
VERMELHO="\033[0;31m"
AMARELO="\033[1;33m"
AZUL="\033[0;34m"
RESET="\033[0m"

# ── Utilitários ──────────────────────────────────────────────

registar_log(){
    local accao="$1"
    local data=$(date '+%d/%m/%Y')
    local hora=$(date '+%H:%M')
    echo "$data,$hora,$user,$accao" >>login_log.csv
}
linha() {
    echo -e "${AMARELO}============================================${RESET}"
}


#função: Login Admin ───────────────────────────────────────
login_admin() {
    clear
    linha
    echo -e "         ${VERMELHO}ACESSO ADMINISTRADOR${RESET}"
    linha
    local tentativas=0

    while [ $tentativas -lt $MAX_TENTATIVAS ]; do
        echo -n "  Utilizador: "
        read -r user
        echo -n "  Password:   "
        read -rs pass
        echo ""

                local resultado=$(grep ",${user}," "$ADMIN_FILE" | grep ",${pass},")
                 if [ -n "$resultado" ]; then
            registar_log "Admin '$user' acedeu ao sistema."
            echo -e "\n${VERDE}  ✔ Login bem-sucedido! Bem-vindo, Administrador.${RESET}\n"
            menu_admin
            return
        else
            tentativas=$((tentativas + 1))
            local restantes=$((MAX_TENTATIVAS - tentativas))
            echo -e "${VERMELHO}  ✘ Credenciais incorrectas. Tentativas restantes: $restantes${RESET}\n"
            registar_log "Tentativa falhada de login como Admin (utilizador: '$user')."
        fi
    done

    echo -e "${VERMELHO}  Número máximo de tentativas atingido. Acesso bloqueado.${RESET}\n"
    registar_log "Acesso de Admin BLOQUEADO após $MAX_TENTATIVAS tentativas falhadas."
    sleep 2
    menu_principal
}

# ── Função: Login Gerente ─────────────────────────────────────
login_gerente() {
    clear
    linha
    echo -e "           ${AMARELO}ACESSO GERENTE${RESET}"
    linha
    local tentativas=0

    while [ $tentativas -lt $MAX_TENTATIVAS ]; do
        echo -n "  Utilizador: "
        read -r user
        echo -n "  Password:   "
        read -s pass
        echo ""

           local resultado=$(grep ",${user}," "$GERENTE_FILE" | grep ",${pass},")
           if [ -n "$resultado" ]; then
             registar_log "Gerente '$user' acedeu ao sistema."
            echo -e "\n${VERDE}  ✔ Login bem-sucedido! Bem-vindo, Gerente.${RESET}\n"
            menu_gerente
            return
        else
            tentativas=$((tentativas + 1))
            local restantes=$((MAX_TENTATIVAS - tentativas))
            echo -e "${VERMELHO}  ✘ Credenciais incorrectas. Tentativas restantes: $restantes${RESET}\n"
            registar_log "Tentativa falhada de login como Gerente (utilizador: '$user')."
        fi
    done

    echo -e "${VERMELHO}  Número máximo de tentativas atingido. Acesso bloqueado.${RESET}\n"
    registar_log "Acesso de Gerente BLOQUEADO após $MAX_TENTATIVAS tentativas falhadas."
    sleep 2
    menu_principal
}

# ── Função: Login Caixa ───────────────────────────────────────
login_caixa() {
    clear
    linha
    echo -e "            ${AZUL}ACESSO CAIXA${RESET}"
    linha
    local tentativas=0

    while [ $tentativas -lt $MAX_TENTATIVAS ]; do
        echo -n "  Utilizador: "
        read -r user
        echo -n "  Password:   "
        read -rs pass
        echo ""
              local resultado=$(grep ",${user}," "$CAIXA_FILE" | grep ",${pass},")
                 if [ -n "$resultado" ]; then

            registar_log "Caixa '$user' acedeu ao sistema."
            echo -e "\n${VERDE}  ✔ Login bem-sucedido! Bem-vindo, Caixa.${RESET}\n"
            menu_caixa
            return
        else
            tentativas=$((tentativas + 1))
            local restantes=$((MAX_TENTATIVAS - tentativas))
            echo -e "${VERMELHO}  ✘ Credenciais incorrectas. Tentativas restantes: $restantes${RESET}\n"
            registar_log "Tentativa falhada de login como Caixa (utilizador: '$user')."
        fi
    done

    echo -e "${VERMELHO}  Número máximo de tentativas atingido. Acesso bloqueado.${RESET}\n"
    registar_log "Acesso de Caixa BLOQUEADO após $MAX_TENTATIVAS tentativas falhadas."
    sleep 2
    menu_principal
}

# ── Menus pós-login ───────────────────────────────────────────
menu_admin() {
    clear
    linha
    echo -e "        ${VERMELHO}PAINEL DO ADMINISTRADOR${RESET}"
    linha
    echo "  [1] Gerir utilizadores"
    echo "  [2] Ver logs do sistema"
    echo "  [3] Configurações"
    echo "  [0] Terminar sessão"
    linha
    echo -n "  Opção: "
    read -r op
    case "$op" in
        1) echo -e "\n  → Gestão de utilizadores (a implementar)\n"; sleep 1; menu_admin ;;
        2) echo ""; cat sistema.log 2>/dev/null || echo "  Sem logs ainda."; echo ""; sleep 3; menu_admin ;;
        3) echo -e "\n  → Configurações (a implementar)\n"; sleep 1; menu_admin ;;
        0) registar_log "Admin terminou sessão."; menu_principal ;;
        *) echo -e "${VERMELHO}  Opção inválida!${RESET}"; sleep 1; menu_admin ;;
    esac
}

menu_gerente() {
    clear
    linha
    echo -e "          ${AMARELO}PAINEL DO GERENTE${RESET}"
    linha
    echo "  [1] Relatórios de vendas"
    echo "  [2] Gerir stock"
    echo "  [3] Ver funcionários"
    echo "  [0] Terminar sessão"
    linha
    echo -n "  Opção: "
    read -r op
    case "$op" in
        1) registar_log "Acedeu ao relatorio de actividades"     echo -e "\n  → Relatórios (a implementar)\n"; sleep 1; menu_gerente ;;
        2) registar_log "Acedeu ao estoque do superMercado"      echo -e "\n  → Gestão de stock (a implementar)\n"; sleep 1; menu_gerente ;;
        3) registar_log "Gerente acedeu a lista de funcionarios" echo -e "\n  → Lista de funcionários (a implementar)\n"; sleep 1; menu_gerente ;;
        0) registar_log "Gerente terminou sessão."; menu_principal ;;
        *) echo -e "${VERMELHO}  Opção inválida!${RESET}"; sleep 1; menu_gerente ;;
    esac
}

menu_caixa() {
source Vendas.sh
    clear
    linha
    echo -e "            ${AZUL}PAINEL DO CAIXA${RESET}"
    linha
    echo "  [1] Nova venda"
    echo "  [2] Consultar Produto"
    echo "  [3] Fechar caixa"
    echo "  [0] Terminar sessão"
    linha
    echo -n "  Opção: "
    read -r op
    case "$op" in
        1) menu_venda;; sleep 1; 
        2) echo -e "\n  → Consultar preço (a implementar)\n"; sleep 1; menu_caixa ;;
        3) echo -e "\n  → Fecho de caixa (a implementar)\n"; sleep 1; menu_caixa ;;
        0) registar_log "Caixa terminou sessão."; menu_principal ;;
        *) echo -e "${VERMELHO}  Opção inválida!${RESET}"; sleep 1; menu_caixa ;;
    esac
}

# ── Ponto de entrada ──────────────────────────────────────────
