#!/usr/bin/bash

final_folder=/home/bic/INVARIANT/final_folder
for file in /home/bic/INVARIANT/LEN_FILES/*.txt; do
max_length=0
max_length_locus=""

while IFS=$'\t' read locus_tag length; do
        if ((length > max_length)) ; then
                max_length="$length"
                max_length_locus="$locus_tag"
        fi
done < "$file"

echo "the max length $max_length"
echo "the locus tag with max length $max_length_locus"


ninety_percent=$((max_length*90/100))
echo "The ninety percent of $max_length is $ninety_percent"

output_file="${file%.txt}_new.txt"
awk -F"\t" -v ninety_percent="$ninety_percent" '$2 >= ninety_percent {print $0}' "$file" > "$output_file"

output1="${output_file%_tr_new.txt}_locus.txt"
awk -F"\t" '{print $1}' "$output_file" > "$output1"

mv *_locus.txt "$final_folder"
done


for a in /home/bic/INAVARIANT/final_folder/*.txt
do
        ./seqtk subseq final.faa "$a" > "$a.fasta"
mv /home/bic/INVARIANT/final_folder/*.fasta /home/bic/INVARIANT/F3
done

~

#The above script calculates takes the file (locus tags "\t" length ), echoes the maximum length and an its locus tag and calculates the 90 percent  of the maximum length which is saved in form of a variable , 
and then  only redircts >= to 90% values to another file and then only selects coloum one with awk and uses agin seqtk o revieve fasta files

