import os

directory = '/home/shweta/AB-AMR_v2/Strains_700_fasta/ffn_700/'
for filename in os.listdir(directory):
        if filename.endswith('.ffn'):  # Only process files with the .fasta extension
                    print(filename)
                    cmd = 'blastn -query ' + os.path.join(directory, filename) + ' -db VFDB_setB_nt.fas -out VFDB_963_BLAST/BLAST_output_' + filename + ' -outfmt 7 -evalue 1e-4 -qcov_hsp_perc 95.0 -perc>
                    print(cmd)
                    os.system(cmd)

(base) shweta@shweta:~/shreya$ ls -1 | wc -l filtered_963_vf.csv 
963 filtered_963_vf.csv

#code to count the no of hits for each virulence factor

import subprocess

input_filename = "filtered_963_vf.csv"
output_filename = "output_grep_BLAST.csv"

with open(input_filename, "r") as infile, open(output_filename, "a") as outfile:
    for ln in infile:
        ln = ln.strip()
        cmd = f'grep -r "{ln}" *.ffn | wc -l'
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        output = result.stdout.strip() if result.returncode == 0 else "0"
        outfile.write(f"{ln}\t{output}\n")
        outfile.flush()
        print(f"Line: {ln}, Result: {output}")