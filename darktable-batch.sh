#! /bin/bash

IMAGES=$(ls $1/*.xmp)
mkdir -p $1/out

for img_xmp in $(ls $1/*.xmp); do
    basepath=${img_xmp%%.*}
    basefmt=$(echo $img_xmp | sed 's/^.*\.\(\S*\)\..*$/\1/')
    img_name=$(basename $img_xmp .$basefmt.xmp)
    darktable-cli $basepath.$basefmt $img_xmp $1/out/$img_name.$OUTFMT
done
