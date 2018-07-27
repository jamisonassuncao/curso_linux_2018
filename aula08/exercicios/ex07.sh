#!/bin/bash

function soma(){
    n1=$1; n2=$2
    echo "$n1 + $n2 = `bc <<< "scale=2; $n1+$n2"`"
} 

function subtracao(){
    n1=$1; n2=$2
    echo "$n1 - $n2 = `bc <<< "scale=2; $n1-$n2"`"
} 

function multiplicacao(){
    n1=$1; n2=$2
    echo "$n1 x $n2 = `bc <<< "scale=2; $n1*$n2"`"
} 

function divisao(){
    n1=$1; n2=$2
    echo "$n1 / $n2 = `bc <<< "scale=2; $n1/$n2"`"
} 

function exponenciacao(){
    n1=$1; n2=$2
    echo "$n1 ^ $n2 = `bc <<< "scale=2; $n1^$n2"`"
} 


echo "Digite dois números e uma operação (2 x 3)"
read n1 op n2

case $op in

    +) soma $n1 $n2 ;;
    -) subtracao $n1 $n2 ;;
    x) multiplicacao $n1 $n2;;
    /) divisao $n1 $n2 ;;
    ^) exponenciacao $n1 $n2 ;;
    *) echo "Escolha entre as operações (+ - x / ^)"
esac

