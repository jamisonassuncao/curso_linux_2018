#!/bin/bash

read -p "Digite um número inteiro para ver sua tabuada: " num

for i in {1..20}
do
    echo "$num x $i = $[$num*$i]"

done > tabuada_do_$num.dat
