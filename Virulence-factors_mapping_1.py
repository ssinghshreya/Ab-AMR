import os

directory = '/home/shweta/AB-AMR_v2/Strains_700_fasta/ffn_700/'
for filename in os.listdir(directory):
        if filename.endswith('.ffn'):  # Only process files with the .fasta extension
                    print(filename)
                    cmd = 'blastn -query ' + os.path.join(directory, filename) + ' -db VFDB_setB_nt.fas -out VFDB_963_BLAST/BLAST_output_' + filename + ' -outfmt 7 -evalue 1e-4 -qcov_hsp_perc 95.0 -perc>
                    print(cmd)
                    os.system(cmd)

