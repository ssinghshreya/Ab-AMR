#!usr/bin/bash

mmseqs easy-search Prokka/faa/*protein* result tmp --format-output "query, target, evalue, pident, qcov"
