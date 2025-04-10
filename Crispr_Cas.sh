#!/bin/bash

# Number of files to process in parallel

parallel_jobs=15
# Number of threads per job
threads_per_job=4

# Function to run cctyper on a file

run_cctyper() {
    local file="$1"
    cctyper -t $threads_per_job "$file" "${file%.ffn}_output"
}

# Export the function to be used by parallel

export -f run_cctyper

# Find all .ffn files and run cctyper in parallel

find . -name "*.ffn" | xargs -n 1 -P $parallel_jobs -I {} bash -c 'run_cctyper "$@"' _ {}