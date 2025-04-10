#!/usr/bin/bash
output_dir=/home/bic/new_sample/F3/output
for j in /home/bic/new_sample/F3/*.fasta; do
        output_file="${j%_locus.txt.fasta}_msa"
clustalo --in "$j" --cluster-size 893 --out "$output_file" --outfmt clustal

done


for z in /home/bic/new_sample/F3/*_msa; do
        if grep -v 'CLUSTAL O(1.2.4) multiple sequence alignment' "$z" | grep -q '[.:]'; then
    mv "$z" "$output_dir"
 fi

done

#The above script performs and read the consensus symbols,  if the file contains : . it redirects it to another directory