# In-Silico-Design-and-Evaluation-of-CRISPR-Cas9-Guides-Targeted-Gene-Knockout-of-Human-TP53

📖 Project Description

This project implements a fully reproducible in-silico CRISPR-Cas9 guide RNA design pipeline targeting the human TP53 gene using the GRCh38 reference genome.

The workflow combines:

Bash scripting

grep and awk for sequence parsing

bedtools for genomic extraction

bowtie2 for off-target analysis

R (crisprScore) for guide efficiency scoring

The goal is to generate and rank high-quality sgRNAs suitable for experimental TP53 knockout studies.

🧬 Biological Background

TP53 encodes the tumor suppressor protein p53, a key regulator of:

DNA damage repair

Cell cycle arrest

Apoptosis

Tumor suppression

TP53 mutations are common in many cancers. Designing CRISPR guides enables:

Functional genomics research

Cancer model generation

Drug screening studies

🎯 Objectives

Download human genome (GRCh38) and annotation files.

Extract TP53 exon sequences.

Identify NGG PAM sites.

Generate 20 bp sgRNA candidates.

Filter by GC content (40–60%).

Perform genome-wide off-target alignment.

Score guides using Doench 2016 model.

Rank final sgRNA candidates.

📁 Repository Structure
crispr-tp53-knockout/
│
├── README.amd
├── data/
│   ├── genome/
│   ├── annotation/
│   └── results/
│
├── scripts/
│   ├── 01_download_data.sh
│   ├── 02_extract_tp53.sh
│   ├── 03_generate_guides.sh
│   ├── 04_offtarget_alignment.sh
│   └── 05_scoring.R
│
├── environment.yml
└── LICENSE

🔽 Data Sources
Human Genome (GRCh38)

Ensembl FTP:

https://ftp.ensembl.org/pub/release-110/fasta/homo_sapiens/dna/

Gene Annotation (GTF)
https://ftp.ensembl.org/pub/release-110/gtf/homo_sapiens/

⚙️ Requirements
Command-Line Tools

bash

grep

awk

bedtools

bowtie2

samtools

R Packages

crisprScore

dplyr

readr

🚀 Pipeline Execution

Run all steps sequentially:

bash scripts/01_download_data.sh
bash scripts/02_extract_tp53.sh
bash scripts/03_generate_guides.sh
bash scripts/04_offtarget_alignment.sh
Rscript scripts/05_scoring.R

🧪 Workflow Overview
1️⃣ Data Download

Downloads genome FASTA and GTF annotation files.

2️⃣ TP53 Extraction

grep filters TP53 exon entries.

awk converts GTF to BED.

bedtools getfasta extracts exon sequences.

3️⃣ sgRNA Generation

Remove FASTA headers.

Identify PAM motifs (NGG).

Extract 20 bp upstream protospacers.

4️⃣ Filtering

Calculate GC content using awk.

Retain guides between 40–60% GC.

5️⃣ Off-Target Analysis

Build Bowtie2 index.

Align sgRNAs to genome.

Remove multi-hit guides.

6️⃣ Efficiency Scoring

Use Doench 2016 scoring model.

Rank guides by predicted on-target efficiency.
