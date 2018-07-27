#!/bin/bash

mkdir -p lenna

for i in {001..100}
do
    convert lenna.tif -quality $i lenna/lenna$i.jpg
done
