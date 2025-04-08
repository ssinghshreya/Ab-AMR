shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ grep -c "^>" Acinetobacter_baumannii_ATCC_17978.fasta
4     #to check the no of contigs in a file

shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ grep -v ">" Acinetobacter_baumannii_ATCC_17978.fasta | awk '{ sum += length } END { print sum " base pairs" }'
4075779 base pairs       #to check the total no of base pairs in the fasta file

shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ awk '/^>/ { if (seq != "") { print seq > outfile } seq=""; outfile=substr($0, 2) ".fasta" } \
 /^[^>]/ { seq = seq $0 } \
 END { if (seq != "") { print seq > outfile } }' Acinetobacter_baumannii_ATCC_17978.fasta     #to extract contigs from a multi contig file

shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ ls
'071a82bb90b94c6f_1 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="1" topology="circular".fasta'
'071a82bb90b94c6f_2 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="2" topology="circular".fasta'
'071a82bb90b94c6f_3 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="3" topology="circular".fasta'
'071a82bb90b94c6f_4 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="4" topology="circular".fasta'

shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ grep -e ">" -e "[ACGTacgt]" Acinetobacter_baumannii_ATCC_17978.fasta | awk '/>/ { if (seq != "") { printf "%s: %d nucleotides\n", name, length(seq) }; name = substr($0, 2); seq = "
" } !/^>/ { seq = seq $0 } END { printf "%s: %d nucleotides\n", name, length(seq) }'             #to calculate the length of each contig in the file
071a82bb90b94c6f_1 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="1" topology="circular": 3902113 nucleotides
071a82bb90b94c6f_2 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="2" topology="circular": 148955 nucleotides
071a82bb90b94c6f_3 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="3" topology="circular": 13409 nucleotides
071a82bb90b94c6f_4 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="4" topology="circular": 11302 nucleotides


shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$grep -v ">" '071a82bb90b94c6f_1 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="1" topology="circular".fasta' | awk '{ sum += length } END { print sum " base pairs" }'   
 #to cross check the length of first contig in the contig 1 file
3902113 base pairs

shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ mv '071a82bb90b94c6f_1 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="1" topology="circular".fasta' contig_number=1.fasta    #to rename the file

shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ ls          #to view the renamed file
'071a82bb90b94c6f_2 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="2" topology="circular".fasta' Acinetobacter_baumannii_ATCC_17978.fasta
'071a82bb90b94c6f_3 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="3" topology="circular".fasta' 'contig_number=1.fasta'
'071a82bb90b94c6f_4 assembly_id="071a82bb90b94c6f" genome_id="e1d18ea4273549a0" atcc_catalog_number="ATCC 17978" species="Acinetobacter baumannii" contig_number="4" topology="circular".fasta'
shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$

shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ grep -v ">" plasmid_pAB3.fasta | awk '{ sum += length } END { print sum " base pairs" }'
148955 base pairs              #to cross check the basepairs of pAB3

## for CP000521.1

shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ grep -v ">" CP000521.1.fasta | awk '{ sum += length } END { print sum " base pairs" }'
3976747 base pairs          #to check the total number of basepairs        

shreya@DESKTOP-D417TM9:~/AB-AMR/Reference_plasmid_issue$ grep -c "^>" CP000521.1.fasta
1                          #to check the number of contigs