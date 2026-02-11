#!/bin/bash

INPUT=data/results/tp53_exons.fa
OUTPUT=data/results/tp53_candidate_guides.txt

grep -v ">" $INPUT | tr -d '\n' > data/results/tp53_sequence.txt

SEQ=$(cat data/results/tp53_sequence.txt)

echo $SEQ | grep -o '.\{20\}GG' > $OUTPUT

# Calculate GC content
awk '
{
    seq=$0
    gsub(/[^GC]/,"",seq)
    gc=length(seq)/length($0)*100
    if(gc>=40 && gc<=60)
        print $0"\t"gc
}' $OUTPUT > data/results/tp53_gc_filtered.txt
