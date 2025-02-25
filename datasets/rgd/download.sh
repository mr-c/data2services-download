#!/bin/bash
if [[ -z "$1" ]]; then
  echo "Provide a target directory to store downloaded files as argument. E.g.: /data/download/bio2rdf"
  exit 1
fi
mkdir -p $1
cd $1
rm -rf *

# RGD
wget -a download.log ftp://ftp.rgd.mcw.edu/pub/ontology/disease/RDO.obo
