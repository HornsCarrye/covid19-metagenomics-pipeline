#!/bin/bash
samtools faidx data/spades_scaffolds.fasta
echo "Top 5 longest contigues:"
cat data/spades_scaffolds.fasta.fai | sort -k2 -nr | head -n 5
# Extracting the desired one (replace the name if you have a different one)
samtools faidx data/spades_scaffolds.fasta NODE_1_length_29907_cov_150.822528 > data/sars_cov2_single.fa
