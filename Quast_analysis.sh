#!usr/bin/bash
ls *.fasta | parallel --verbose "quast.py -r ATCC17978.fasta  {} -o {.}_out"
