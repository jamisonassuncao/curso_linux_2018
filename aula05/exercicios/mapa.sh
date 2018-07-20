#!/bin/bash


if [ $# -lt "1" ]; then

	echo -e "Digite o nome do arquivo de dados ou execute ./mapa.sh arquivo ou bash mapa.sh arquivo"
	read name

else

	name=$1

fi


ps=data.ps


minlon=-180
maxlon=180
minlat=-89.9
maxlat=89.9

##plota a base do mapa
psbasemap -R$minlon/$maxlon/$minlat/$maxlat -JN20 -K -X2 -Y8 -Bxf30a60 -Byf15a30 -BNWse > $ps


##plota linha de costa, divisão politica, rios etc
pscoast -R -J -Di -K -O -N1/wheat4 -G227/179/94 -A10000 -S124/205/231 -W1/wheat4 >> $ps
psxy plates_borders.dat -R -J -O -K >> $ps
psxy brasil_ibge -R -J -O -K -W0.3,wheat4,-- >> $ps



##PLOTA EVENTOS NO MAPA##

cat $name | awk '$3>8.5 {print $1,$2, $3}' | psxy -R -J -O -K -W -Sa0.65 -Cpaleta.cpt >>$ps
cat $name | awk '$3>8 && $3<8.5 {print $1,$2, $3}' | psxy -R -J -O -K -W -Sa0.55 -Cpaleta.cpt >>$ps
cat $name | awk '$3>7.5 && $3<8 {print $1,$2, $3}' | psxy -R -J -O -K -W -Sa0.45 -Cpaleta.cpt >>$ps
cat $name | awk '$3>7 && $3<7.5 {print $1,$2, $3}' | psxy -R -J -O -K -W -Sa0.35 -Cpaleta.cpt >>$ps
cat $name | awk '$3>6.5 && $3<7 {print $1,$2, $3}' | psxy -R -J -O -K -W -Sa0.25 -Cpaleta.cpt >>$ps
cat $name | awk '$3<6.5 && $3>6 {print $1,$2, $3}' | psxy -R -J -O -K -W -Sa0.20 -Cpaleta.cpt >>$ps
cat $name | awk '$3<6 && $3>5 {print $1,$2, $3}' | psxy -R -J -O -K -W -Sa0.20 -Cpaleta.cpt >>$ps
cat $name | awk '$3<5 {print $1,$2, $3}' | psxy -R -J -O -K -W -Sa0.15 -Cpaleta.cpt >>$ps

psscale -Dx22/5+w4/0.5+jRM+mua+e -Bf0.5a1+l"Magnitude" -S -Cpaleta.cpt -O -K >> $ps


###PROJEÇÃO DOS EVENTOS EM PROFUNDIDADE###

cat $name |\
	awk 'NF==4 {print $1, $4}'|
	psxy -R$minlon/$maxlon/-10/750 -JX20/-5 -K -O -X0.5 -Bxf5a30+u"\232" -By100+l"Depth (km)" -BnESw -Al -Y-6.5 -Sc0.2 -W -Gred>>$ps



##finalizando o mapa
psxy /dev/null -R -J -O -Sp >> $ps


#abre o arquivo .ps na tela
psconvert $ps -F$1_events -A -Tf -P
evince $1_events.pdf &
