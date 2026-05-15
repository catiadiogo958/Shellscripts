#!/bin/bash
VENDA_FILE="User_Produto.csv"

menu_venda(){
echo "|-----------------------------------------------------|"
echo "|         Tela de Venda do SuperMercado               |"
echo "|-----------------------------------------------------|"
echo "Digite o Codigo do Produto a ser vendido:"
read cod

cod="$ID"
  case  $cod  in
1) echo ""


else
cat -n
echo -n "Nome do produto: "
read nome
grep -i "$nome" "$ESTOQUE_FILE"

}
