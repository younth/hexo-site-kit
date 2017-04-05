#!/bin/bash

PROJECT_ROOT=$PWD

#输出目录
outputdir=$PROJECT_ROOT/output

rm -rf $outputdir

mkdir $outputdir

cp -r api $outputdir
cp -r css $outputdir
cp -r en $outputdir
cp -r images $outputdir
cp -r zh-cn $outputdir
cp *.html $outputdir

echo "build end"