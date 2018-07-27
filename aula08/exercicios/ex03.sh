#!/bin/bash

## não foi mostrado em aula, mas com uma simples busca se encontra o comando date que pega a data do sistema.
## digitando date +%A temos como retorno o dia da semana
## digitando date +%d temos o dia do mês
## digitando date +%B temos o mes
## consulte man date ou date --help


read -p "Digite o nome de um dia da semana: " dia

today=`date +%A`
n_date=`date +%d`
month=`date +%B`


## converte o dia em numero para facilitar as operacões
function convertDate2number(){
    sun=1;mon=2;tue=3;wed=4;thu=5;fri=6;sat=7
    day=$1

    case "$day" in

        "domingo")
            nday=1 ;;
        "segunda")
            nday=2 ;;
        "terca")
            nday=3 ;;
        "quarta")
            nday=4 ;;
        "quinta")
            nday=5 ;;
        "sexta")
            nday=6 ;;
        "sabado")
            nday=7 ;;
        *) 
            nday=-1;;
     esac

    echo $nday
}

##verifica se o numero de dias dado é no próximo mês ou não
function checkMonth() {

    month=$1; sumday=$2

    case "$month" in

        janeiro|marco|maio|julho|agosto|outubro|dezembro) 

            if [ $sumday -le 31 ]; then
                echo " $sumday $month"
            else
                nmonth=`setMonth $month`
                day=$[$sumday-31]
                echo " $day $month"
            fi
            ;;

        abril|junho|setembro|novembro)

            if [ $sumday -le 30 ]; then
                echo " $sumday $month"
            else
                nmonth=`setMonth $month`
                day=$[$sumday-31]
                echo " $day $nmonth"
            fi
            ;;

        fevereiro)

            nmonth=`setMonth $month`
            day=$[$sumday-31]
            echo "  $day $nmonth"
            ;;

    esac

}

## dado o mês atual retorna o seguinte
function setMonth() {

    month=$1

    case "$month" in

        "janeiro") next=fevereiro ;;
        "fevereiro") next=marco ;;
        "marco") next=abril ;;
        "abril") next=maio ;;
        "maio") next=junho ;;
        "junho") next=julho ;;
        "julho") next=agosto ;;
        "agosto") next=setembro ;;
        "septermber") next=outubro ;;
        "outubro") next=novembro ;;
        "novembro") next=dezembro ;;
        "dezembro") next=janeiro ;;

    esac

    echo $next

}

## converte o dia dado e o dia atual em número
n_today=`convertDate2number $today`
n_choosed=`convertDate2number $dia`

##verifica se o dia dado existe
if [ $n_choosed -lt 0 ]; then
    echo "Escolha um dia válido!"
    exit
fi

## calcula quantos dias o dia dado está a frente
if [ $n_choosed -lt $[$n_today+1] ]; then
    res=$[$n_choosed+7-$n_today]
else
    res=$[$n_choosed-$n_today]
fi

echo -n "A próxima $dia será em $res dia(s),"


## calcula o mês e o dia da data pedida
if [ $[$n_date+$res] -gt 28 ]; then
    checkMonth $month $[$n_date+$res]
else
    echo " $[$n_date+$res] $month"
fi

