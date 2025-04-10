#!usr/bin/bash
ls *.fasta | parallel --verbose "prokka --proteins *.gbk  --kingdom Bacteria  --genus Acinetobacter {} --prefix {.}_out"
