#!/bin/bash

GENOME=data/genome/Homo_sapiens.GRCh38.dna.primary_assembly.fa
GUIDES=data/results/tp53_gc_filtered.txt

bowtie2-build $GENOME genome_index

cut -f1 $GUIDES > data/results/guides.fa

bowtie2 -x genome_index -f data/results/guides.fa -S data/results/offtargets.sam -N 1
