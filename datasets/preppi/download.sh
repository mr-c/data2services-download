#!/bin/bash
if [[ -z "$1" ]]; then
  echo "Provide a target directory to store downloaded files as argument. E.g.: /data/download"
  exit 1
fi
mkdir -p $1
cd $1
rm -rf *


BASE_URI="http://data.wikipathways.org/current/rdf/"


########## Download files

wget -a download.log https://honiglab.c2b2.columbia.edu/PrePPI/ref/preppi_final600.txt.tar.gz


# UNTAR recursively all files in actual dir
find . -name "*.tar.gz" -exec tar -xzvf {} \;


## RENAME EXTENSION (e.g.: txt in tsv)
rename s/\.txt/.tsv/ *.txt