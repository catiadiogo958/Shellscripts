#!/bin/bash


subtracao(){
echo "Digite dois Numeros:"
read numero
read numero1
echo "Resultado:$((numero - mumero1))"
echo "$Resultado"
}
divisao(){
echo "Digite dois Numeros:"
read numero
read numero1
echo "Resultado:$((numero / numero1))"
echo "$Resultado"
}

multiplicacao(){
 echo "Digite dois numeros:"
read numero
read numero1
echo "Resultado: $((numero * numero1))"
echo "$Resultado"
}

resto_divisao(){
 echo "Digite dois numeros:"
read numero
read numero1
echo "Resultado: $((numero % numero1))"
echo "$Resultado"
 }

equacao_2grau() {
  echo "===== Equacao do 2 grau (ax2 + bx + c) ====="
  echo "Digite o valor de a:"
  read a
  echo "Digite o valor de b:"
  read b
  echo "Digite o valor de c:"
  read c

  delta=$(echo "$b * $b - 4 * $a * $c" | bc -l)
  echo "Delta = $delta"

  if [ $(echo "$delta < 0" | bc -l) -eq 1 ]
  then
    echo "Delta negativo: sem raizes reais!"

  elif [ $(echo "$delta == 0" | bc -l) -eq 1 ]
  then
    x=$(echo "scale=2; -$b / (2 * $a)" | bc -l)
    echo "Uma raiz: x = $x"

  else
    x1=$(echo "scale=2; (-$b + sqrt($delta)) / (2 * $a)" | bc -l)
    x2=$(echo "scale=2; (-$b - sqrt($delta)) / (2 * $a)" | bc -l)
    echo "x1 = $x1"
    echo "x2 = $x2"
  fi
}

raiz(){
 echo "Digite um numero"
read numero
Resultado=$(echo "scale = 2; sqrt($numero)" |bc)
echo "Raiz quadrada de $numero = $Resultado"
 }


menu_principal(){
while true; do
 
echo "------------------------------------------"
echo "=======Minha calculadora no Script========"
echo "------------------------------------------"

echo "Selecione a operacao q seja realizar"
echo "[1].Multiplicacao"
echo "[2].Divisao"
echo "[3].Sutracao"
echo "[4].Resto da divisao"
echo "[5].Raiz quadrada"
echo "[6].Equsao do 2 grau"
echo "[0].Sair..."
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
