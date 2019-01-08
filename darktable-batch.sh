#! /bin/bash

IMAGES=$(ls $1/*.xmp)

for img in $(ls $1/*.xmp); do
    basepath=${img%%.*}
    echo "darktable-cli ${basepath}.PEF ${basepath}.PEF.xmp ${basepath}.jpg"
done
