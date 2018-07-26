#!/bin/bash

echo "Digite um número intreiro"
read num

echo "(i) O número lido foi $num"
echo "(ii) $num+5 = $[$num+5]"

if [ $[$num%2] -eq 0 ]; then

    echo "(iii) $num é par"

else

    echo "(iii) $num é ímpar"

fi

echo "(iv) 3^2 = $[$num**2]"
