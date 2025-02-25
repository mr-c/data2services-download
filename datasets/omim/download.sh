#!/bin/bash
if [[ -z "$1" ]]; then
  echo "Provide a target directory to store downloaded files as argument. E.g.: /data/download"
  exit 1
fi
mkdir -p $1
cd $1
rm -rf *

wget -a download.log https://omim.org/static/omim/data/mim2gene.txt

# Remove the 4 first lines
sed -i -e '1,5d' mim2gene.txt

## RENAME EXTENSION (e.g.: txt in tsv)
rename s/\.txt/.tsv/ *.txt

# Add columns label for TSV
sed -i '1s/^/MIM_Number\tMIM_Entry_Type\tEntrez_Gene_ID_NCBI\tApproved_Gene_Symbol_HGNC\tEnsembl_Gene_ID_Ensembl\n/' *.tsv