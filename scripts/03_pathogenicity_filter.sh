#!/bin/bash

# Stage 3: In silico pathogenicity prediction filtering
#
# Purpose:
# Retain variants with computational evidence of potential deleteriousness
# from at least one of the selected prediction tools.
#
# Predictors used:
# - SIFT
# - PolyPhen-2 HDIV
# - PolyPhen-2 HVAR
# - MutationTaster
#
# Retention rule:
# A variant was retained when at least one of the following criteria was met:
# - SIFT score <= 0.05
# - PolyPhen-2 HDIV prediction = D or P
# - PolyPhen-2 HVAR prediction = D or P
# - MutationTaster prediction = D or A
#
# Input:
# Frequency-filtered variant table
#
# Output:
# Pathogenicity-filtered variant table

awk -F '\t' 'BEGIN{OFS="\t"} NR==1 || (($15 != "." && $15+0 <=0.05) || $17=="D" || $17=="P" || $19=="D" || $19=="P" || $23=="D" || $23=="A")' \
    278_01_frequency.txt \
    > 278_02_pathogenicity.txt

awk -F '\t' 'BEGIN{OFS="\t"} NR==1 || (($15 != "." && $15+0 <=0.05) || $17=="D" || $17=="P" || $19=="D" || $19=="P" || $23=="D" || $23=="A")' \
    3347_01_frequency.txt \
    > 3347_02_pathogenicity.txt

awk -F '\t' 'BEGIN{OFS="\t"} NR==1 || (($15 != "." && $15+0 <=0.05) || $17=="D" || $17=="P" || $19=="D" || $19=="P" || $23=="D" || $23=="A")' \
    MM47_01_frequency.txt \
    > MM47_02_pathogenicity.txt

# Count records in the pathogenicity-filtered output files
wc -l *_02_pathogenicity.txt
