#!/bin/bash



subtracao() {
  echo "Digite dois Numeros:"
  read numero
  read numero1
  echo "Resultado: $((numero - numero1))"
  sleep 3
  return
}
divisao(){
echo "Digite dois Numeros:"
read numero
read numero1
echo "Resultado: $((numero / numero1))"

sleep 3
return
}

multiplicacao(){
 echo "Digite dois numeros:"
read numero
read numero1
echo "Resultado: $((numero * numero1))"


sleep 2
return
}

resto_divisao(){
 echo "Digite dois numeros:"
read numero
read numero1
echo "Resultado: $((numero % numero1))"
 
sleep 2
return
}

equacao_2grau() {
clear #Vai limpar a tela para  pedir os valores
  echo "=== Equacao do 2 grau (ax² + bx + c = 0) ==="
  echo "Digite o valor de a:"
  read a
  echo "Digite o valor de b:"
  read b
  echo "Digite o valor de c:"
  read c

#Vai  Verificar se algum valor(a,b ou c) e 0
  if [ "$a" -eq 0 ]; then
    echo "Erro: o valor de 'a' nao pode ser 0!"
    echo "Se 'a' for 0 a equacao deixa de ser do 2 grau."
sleep 3
    return 
  fi

  if [ "$b" -eq 0 ]; then
    echo "Atencao: 'b' e 0, a equacao fica: ${a}x² + ${c} = 0"
  fi

  if [ "$c" -eq 0 ]; then
    echo "Atencao: 'c' e 0, a equacao fica: ${a}x² + ${b}x = 0"
  fi



  # Calcula o valor de delta
  delta=$(echo "$b^2 - 4*$a*$c" | bc)
  echo "Delta = $delta"

  if [ $(echo "$delta < 0" | bc) -eq 1 ]; then
    echo "Delta negativo: a equacao nao tem raizes reais!"

  elif [ $(echo "$delta == 0" | bc) -eq 1 ]; then
    x=$(echo "scale=2; -$b / (2*$a)" | bc)
    echo "A equacao tem uma raiz: x = $x"

  else
    x1=$(echo "scale=2; (-$b + sqrt($delta)) / (2*$a)" | bc)
    x2=$(echo "scale=2; (-$b - sqrt($delta)) / (2*$a)" | bc)
    echo "x1 = $x1"
    echo "x2 = $x2"
  fi

sleep 5
return 
}

raiz(){
 echo "Digite um numero"
read numero
Resultado=$(echo "scale = 2; sqrt($numero)" |bc)
echo "Raiz quadrada de $numero = $Resultado"
 
sleep 3
return 
}


menu_principal(){
while true; do
 clear
echo "------------------------------------------"
echo "=======Minha calculadora no Script========"
echo "------------------------------------------"

echo "Selecione a operacao que deseja realizar"
echo "[1].Multiplicacao"
echo "[2].Divisao"
echo "[3].Sutracao"
echo "[4].Resto da divisao"
echo "[5].Raiz quadrada"
echo "[6].Equsao do 2 grau"
echo "[0].Sair"
read opcao

	case  $opcao in
1) multiplicacao;;

2)divisao;;

3)subtracao;;

4)resto_divisao;;

5)raiz;;

6)equacao_2grau;;

0) echo "A sair..."; exit 0;;



esac

done
}

menu_principal
