#!/bin/bash

## não foi mostrado em aula, mas com uma simples busca se encontra o comando date que pega a data do sistema.
## digitando date +%A temos como retorno o dia da semana
## digitando date +%d temos o dia do mês
## digitando date +%B temos o mes
## consulte man date ou date --help
## P.S meu sistema padrão é em ingês então resolvi usando os dias em inglês


read -p "Type a day name: " dia

## como o comando date da o nome do dia e do mês com a primeira letra maiuscula é preciso deixar tudo minúsuclo
today=`echo "$(date +%A)" | tr '[:upper:]' '[:lower:]'`
n_date=`date +%d`
month=`echo "$(date +%B)" | tr '[:upper:]' '[:lower:]'`


## converte o dia em numero para facilitar as operações
function convertDate2number(){
    sun=1;mon=2;tue=3;wed=4;thu=5;fri=6;sat=7
    day=$1

    case "$day" in

        "sunday")
            nday=1 ;;
        "monday")
            nday=2 ;;
        "tuesday")
            nday=3 ;;
        "wednesday")
            nday=4 ;;
        "thursday")
            nday=5 ;;
        "friday")
            nday=6 ;;
        "saturday")
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

        january|march|may|july|august|octuber|december) 

            if [ $sumday -le 31 ]; then
                echo " on $month $sumday"
            else
                nmonth=`setMonth $month`
                day=$[$sumday-31]
                echo " on $nmonth $day"
            fi
            ;;

        april|june|september|november)

            if [ $sumday -le 30 ]; then
                echo " on $month $sumday"
            else
                nmonth=`setMonth $month`
                day=$[$sumday-31]
                echo " on $nmonth $day"
            fi
            ;;

        february)

            nmonth=`setMonth $month`
            day=$[$sumday-31]
            echo " on $nmonth $day"
            ;;

    esac

}

## dado o mês atual retorna o seguinte
function setMonth() {

    month=$1

    case "$month" in

        "january") next=february ;;
        "february") next=march ;;
        "march") next=april ;;
        "april") next=may ;;
        "may") next=june ;;
        "june") next=july ;;
        "july") next=august ;;
        "august") next=september ;;
        "septermber") next=octuber ;;
        "octuber") next=november ;;
        "november") next=december ;;
        "december") next=january ;;

    esac

    echo $next

}

## converte o dia dado e o dia atual em número
n_today=`convertDate2number $today`
n_choosed=`convertDate2number $dia`

##verifica se o dia dado existe
if [ $n_choosed -lt 0 ]; then
    echo "Type a valid name day!"
    exit
fi

## calcula quantos dias o dia dado está a frente
if [ $n_choosed -lt $[$n_today+1] ]; then
    res=$[$n_choosed+7-$n_today]
else
    res=$[$n_choosed-$n_today]
fi

echo -n "The next $dia will be in $res day(s)"


## calcula o mês e o dia da data pedida
if [ $[$n_date+$res] -gt 28 ]; then
    checkMonth $month $[$n_date+$res]
else
    echo " on $month $[$n_date+$res]"
fi

