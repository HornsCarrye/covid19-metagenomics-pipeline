# SARS-CoV-2 Metagenomic Pipeline

## Overview
This repository contains a complete bioinformatics pipeline for the identification, annotation, and primer design for a novel viral pathogen (SARS-CoV-2). The starting point is a raw assembled metagenomic dataset (`spades_scaffolds.fasta`) obtained from a clinical sample (bronchoalveolar lavage fluid). The pipeline moves from assembly quality assessment to viral identification, genome annotation, and finally, the design of a PCR-based diagnostic test.

## Pipeline Steps & Key Results

### 1. Assembly Assessment
*   **Tool:** QUAST
*   **Result:** We obtained `666` scaffolds >= 1000 bp. The largest contig was `29907` bp in length.

### 2. Viral Identification & Extraction
*   **Tools:** Samtools, NCBI BLAST
*   **Result:** A specific contig (`NODE_1_length_29907_cov_150.822528`) of 29,907 bp was extracted. BLAST analysis (limited to viruses) identified it as **SARS-CoV-2** (95% identity to *Bat SARS-like coronavirus isolate bat-SL-CoVZC45*).

### 3. Genome Annotation
*   **Tool:** Prokka
*   **Result:** The viral genome was annotated (Kingdom: Viruses). Prokka identified `9` coding sequences (CDS), including the crucial Spike (surface glycoprotein) gene.

### 4. PCR Primer Design
*   **Tool:** NCBI Primer-BLAST
*   **Result:** Based on the Spike protein sequence, **Primer Pair 10** was selected as the optimal candidate for a diagnostic PCR test.
    *   **Forward primer:** `AACGCCACCAGATTTGCATC`
    *   **Reverse primer:** `TTTGCCCTGGAGCGATTTGT`
    *   **Amplicon size:** 217 bp
    *   **Tm:** ~60°C (Difference < 1°C)
    *   **GC content:** 50.00%
    *   *Justification:* Chosen due to optimal GC content, minimal self-complementarity (preventing primer-dimers), and suitable amplicon length for qPCR.

## Repository Structure
*   `data/` — Input FASTA files (ignored by Git due to size).
*   `scripts/` — Bash scripts to run the pipeline.
*   `results/` — Output directories (QUAST reports, Prokka annotations).
*   `envs/` — Conda environment configuration file.

## Tools Used
*   Python 3.10
*   QUAST 5.2.0
*   Samtools 1.9
*   Prokka 1.14.6
*   NCBI BLAST / Primer-BLAST

## Reproducibility
To reproduce this analysis, first create the Conda environment:
```bash
conda env create -f envs/environment.yml
conda activate covid_pipeline
```
Then run the scripts in numerical order:
```bash
./scripts/01_run_quast.sh
./scripts/02_extract_contig.sh
./scripts/03_run_prokka.sh
```

Note: BLAST and Primer-BLAST steps were performed via NCBI web interface using the sequences generated in step 2 and 3



