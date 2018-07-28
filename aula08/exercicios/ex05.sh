#!/bin/bash

#estou jogando a saida na tela e no arquivo

opt="n"
while [[ ! $opt =~ ^(y|Y)$ ]]
do
     	read -p "Digite um número inteiro para ver sua tabuada: " num

	for i in {1..20}
	do
	    echo "$num x $i = $[$num*$i]"

	done
	
	echo "Deseja sair: (y/n)"
	read opt
     
     while [[ ! $opt =~ ^(y|Y|n|N)$ ]]
     do
          echo "Deseja sair: (y/n)"
     	read opt
     done

done

