#!/bin/bash

PRODUTO_FILE="User_Produto.csv"

buscar_produto(){
    echo -n "Digite o nome do produto: "
    read nome

    # Procura no ficheiro
    local resultado=$(grep -i "$nome" "$PRODUTO_FILE")

    if [ -z "$resultado" ]; then
        echo "Nenhum produto encontrado!"
        sleep 2
        return
    fi

    # Mostra os produtos encontrados
    echo "$resultado"
}
actualizar_quantidade(){
echo -n "Nome do produto: "
read nome
grep -i "$nome" "$ESTOQUE_FILE"(){
    echo -n "Digite o ID do produto: "
    read id

    # Procura o produto no ficheiro
    local produto=$(grep "^${id}," "$PRODUTO_FLIE")

    if [ -z "$produto" ]; then
        echo "Produto nao encontrado!"
        sleep 2
        return
    fi

    # Mostra o produto encontrado
    echo "Produto encontrado: $produto"
    echo -n "Nova quantidade: "
    read nova_qtd
sed -i "s/^${id},/${id},${nome},${categoria},${nova_qtd},/" User_Produto.csv
    # Aqui tens de usar o sed para actualizar
    # Tenta escrever esta parte!
}
adicionar_produto(){

echo "Digite o ID_codigo do produto:"
read ID
echo "Digite o Nome do Produto:"
read NOME
echo "Digite o Preco do Produto:"
read PRECO
echo "Digite a Quantidade do Produto:"
read QUANTIDADE

echo "$ID,$NOME,$PRECO,$QUANTIDADE" >>  user_Produto.csv
}
menu_produto(){
echo "|------------------------------------------------|"
echo "|           Menu Produtos disponivel             |"
echo "|------------------------------------------------|"

echo ""

echo "[1].Atualizar Produto"
echo "[2].Adicionar Produto"
echo "[3].Eliminar Produto"
echo "[4].Listra Todos Produtos"
read op
case $op in 
1) actualizar_produto ;;
2) adicionar_produto ;;

}
