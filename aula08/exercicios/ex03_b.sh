echo "entre com a dia da semana "
read data

today=`date +%s`
day="nan"
i=1

while [[ $data != $day ]]
do
     day=$(date -d @$[$today+$i*3600*24] +%A)
     let i++
     if [ $data == $day ];
     then
          echo "Faltam $(($i-1)) dias para $data, `date -d @$[$today+$i*3600*24] +%d/%m/%y`"
     fi
done

