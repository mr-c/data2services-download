#!/bin/bash
if [[ -z "$1" ]]; then
  echo "Provide a target directory to store downloaded files as argument. E.g.: /data/kraken-download/datasets"
  exit 1
fi
mkdir -p $1
cd $1
rm -rf *

# MeSH Medical Subject Headings
wget -a download.log ftp://nlmpubs.nlm.nih.gov/online/mesh/rdf/mesh.nt.gz
wget -a download.log ftp://nlmpubs.nlm.nih.gov/online/mesh/rdf/void_1.0.0.ttl
wget -a download.log ftp://nlmpubs.nlm.nih.gov/online/mesh/rdf/vocabulary_1.0.0.ttl

find . -name "*.gz" -exec gzip -d  {} +
