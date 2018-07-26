#!/bin/bash

read -p "Digite um número inteiro: " num

while [[ $num != +([0-9]) ]]; do
    read -p "Número inválido, digite novamente: " num
done

for i in $(seq 1 $num)
do 
    for j in $(seq 1 $i)
    do
        echo -ne "* "
    done 
    echo " "
done

