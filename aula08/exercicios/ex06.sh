#!/bin/bash

read -p "Quer ver as letras pares(p) ou ímpares? (p/i): " option

if [ "$option" = "p" ]; then
    echo {B..Z..2}
elif [ "$option" = "i" ]; then
    echo {A..Z..2}
else
    echo "Opção inválida"
fi

