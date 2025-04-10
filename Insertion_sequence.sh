#!usr/bin/bash
nohup bash -c 'for file in *.fasta; do isescan.py --seqfile "$file" --output "$file.out" & done' &
