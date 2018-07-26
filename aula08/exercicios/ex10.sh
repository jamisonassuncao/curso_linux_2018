#!/bin/bash

##a maneira mais fácil de resolver esse problema é fazendo um loop no shell e fitrando os dados no awk, mas notem que o awk precisa saber o valor de i na para selecionar corretamente o intervalo de busca. Para isso podemos usar a opção -v do awk para ele receber a variavel do shell

for i in {1..9}
do
    echo "$i-$[$i+1] = `cat catalogo_IRIS.dat | awk -v i=$i -F'[|,]' '$12>=i && $12 < (i+1) {print $1, i}' | wc -l`"
done | tee  ev_mag.dat


## | tee  ev_mag.dat usando o comando tee é possivel visualizar a saida do programa na tela e ao mesmo tempo salvar no arquivo, isso costuma ser bastante últi!
