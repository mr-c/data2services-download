#!/bin/bash
if [[ -z "$1" ]]; then
  echo "Provide a target directory to store downloaded files as argument. E.g.: /data/download/bio2rdf"
  exit 1
fi

mkdir -p $1
cd $1
rm -rf *

wget -a download.log http://genomics.senescence.info/diet/dataset.zip

wget -a download.log http://genomics.senescence.info/diet/TableS2.xls

# Unzip all files in subdir with name of the zip file
find . -name "*.zip" | while read filename; do unzip -o -d "`dirname "$filename"`/${filename%.*}" "$filename"; done;