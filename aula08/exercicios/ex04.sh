#!/bin/bash

permissoes=0

if [ -r "ex02.sh" ]; then
    permissoes=$[$permissoes+4]
fi

if [ -w "ex02.sh" ]; then
    permissoes=$[$permissoes+2]
fi

if [ -x "ex02.sh" ]; then
    permissoes=$[$permissoes+1]
fi

echo "A permissão do arquivo ex02.sh para o usuário atual é $permissoes"
