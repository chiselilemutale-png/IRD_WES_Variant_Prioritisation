#!/bin/bash

# Stage 2: Population-frequency filtering
#
# Purpose:
# Retain rare variants based on the population-frequency annotation
# in the supplied ANNOVAR hg19_multianno.txt file.
#
# Filtering criterion:
# Variants were retained when the value in column 13 was either:
#   - missing ("."); or
#   - less than 0.01.
#
# In the study input files, column 13 corresponded to
# the 1000g2012apr_all annotation.
#
# Input:
# ANNOVAR hg19_multianno.txt file
#
# Output:
# Frequency-filtered variant table.

# Filter variants using the population-frequency criterion
awk -F '\t' 'NR==1 || $13=="." || $13<0.01' \
    278unique-sort.variants.combined.annovar.vcf.hg19_multianno.txt \
    > 278_01_frequency.txt

awk -F '\t' 'NR==1 || $13=="." || $13<0.01' \
    3347unique-sort.variants.combined.annovar.vcf.hg19_multianno.txt \
    > 3347_01_frequency.txt

awk -F '\t' 'NR==1 || $13=="." || $13<0.01' \
    MM47unique-sort.variants.combined.annovar.vcf.hg19_multianno.txt \
    > MM47_01_frequency.txt
    
# Inspect the resulting file and display numbered fields
head 278_01_frequency.txt \
    | awk -F '\t' '{for(i=1; i<=NF; i++) print i, $i}'

head 3347_01_frequency.txt \
    | awk -F '\t' '{for(i=1; i<=NF; i++) print i, $i}'

head MM47_01_frequency.txt \
    | awk -F '\t' '{for(i=1; i<=NF; i++) print i, $i}'
