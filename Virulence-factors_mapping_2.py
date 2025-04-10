#This code counts the no of hits for each virulence factor

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