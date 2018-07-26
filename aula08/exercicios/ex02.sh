#!/bin/bash

read -p "Digite dois números inteiros: " n1 n2

#forma de testar se os numero digitados são inteiros, e pedir para o usuário continuar digitando até que o número seja válido
while [[ $n1 != +([0-9]) || $n2 != +([0-9]) ]]; do
    echo "Números inválidos, digite novamente"
    read n1 n2
done


if [ $n1 -gt $n2 ]; then
    echo "(i) $n1 é maior que $n2"
elif [ $n1 -lt $n2 ]; then
    echo "(i) $n1 é menor que $n2"
else
    echo "(i) $n1 é igual a $n2"
fi

if [[ ($[$n1%2] -eq 0 ) && ( $[$n2%2] -eq 0) ]]; then
    echo "(ii) $n1 e $n2 são pares"
elif [[ ($[$n1%2] -eq 1)  && ($[$n2%2] -eq 1) ]]; then
    echo "(ii) $n1 e $n2 são ímpares"
elif [[ ($[$n1%2] -eq 0)  && ($[$n2%2] -eq 1) ]]; then
    echo "(ii) $n1 é par e $n2 é impar"
else
    echo "(ii) $n1 é ímpar e $n2 é par"
fi

if [ $n1 -gt $n2 ]; then
    echo "(iii) raiz quadrada de $n2 é `bc <<< "scale=2; sqrt($n2)"`"
elif [ $n1 -lt $n2 ]; then
    echo "(iii) raiz quadrada de $n1 é `bc <<< "scale=2; sqrt($n1)"`"
else
    echo "(iii) raiz quadrada de $n1 e $n2 é `bc <<< "scale=2; sqrt($n2)"`"
fi

echo "(iv) e^$n2 = `bc -l <<< "scale=2; e($n2)"`"
