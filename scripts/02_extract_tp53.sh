#!/bin/bash

GTF=data/annotation/Homo_sapiens.GRCh38.110.gtf
GENOME=data/genome/Homo_sapiens.GRCh38.dna.primary_assembly.fa

# Extract TP53 exons only
grep "TP53" $GTF | grep "exon" > data/annotation/tp53_exons.gtf

# Convert to BED format
awk 'BEGIN{OFS="\t"} {print $1,$4-1,$5,$7}' data/annotation/tp53_exons.gtf > data/annotation/tp53_exons.bed

# Extract sequences
bedtools getfasta -fi $GENOME -bed data/annotation/tp53_exons.bed -fo data/results/tp53_exons.fa
