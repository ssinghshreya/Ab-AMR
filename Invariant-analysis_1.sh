#!/usr/bin/bash

#assiging the variable to the file names

gene_list="sample_core"
data_file="clustered_proteins"
final_folder="/home/bic/INVARIANT/tr_files"
final_fasta="/home/bic/INVARIANT/final.faa"
sorted_fasta="/home/bic/INVARIANT/sorted_fasta/"

#while loop for reading each gene name in file

while IFS= read  gene_name; do
        #gene_name variable exapanded & added suffix 
    output_file="${gene_name}.txt"
    grep  -F "$gene_name" "$data_file" > "$output_file"
    #read gene_name from gene_list
done < "$gene_list"

for output_file in *.txt; do

        transpose_file="${output_file%.txt}_tr.txt"
        tr '\t' '\n' <"$output_file" > "$final_folder/$transpose_file"
done

for f in /home/bic/INVARIANT/tr_files/*.txt
do
        sed 's/.*: //' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
done

for i in /home/bic/INVARIANT/tr_files/*.txt
do
        ./seqtk subseq "$final_fasta" "$i" > "$i.tmp" && mv "$i.tmp" "$i"
done

for g in /home/bic/INVARIANT/tr_files/*.txt
do
        cp "$g" "$sorted_fasta"
done
~                                                                                                                                                                                                           
~
#The above script greps the core gene name, in clustered_proteins (roary _output_file), transposes it and the uses sed command to remove the colon and character (here gene name) in the header of the file before the locus tags , then these files which only contains locus tags,  is given  to seqtk (a package) for retrieving  fasta files corresponding to the particular locus tags.
The final fasta files are stored to tr_files/ and copied to sorted_fasta/

