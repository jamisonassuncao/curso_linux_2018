#!/bin/bash

cat catalogo_IRIS.dat | awk -F'[,|]' '$0 ~/BRAZIL/ {print $12, $5, $4, $6}' | sort -n | awk '{print $2,$3,$4,$1}'
