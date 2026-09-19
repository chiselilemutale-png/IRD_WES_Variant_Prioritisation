#!/bin/bash

# Stage 1: Inspection of ANNOVAR input files
#
# Purpose:
# Inspect the supplied ANNOVAR hg19_multianno.txt files before filtering.
# This stage was used to examine the file structure, obtain an initial
# variant count, and identify annotation column positions.
#
# Input:
# ANNOVAR hg19_multianno.txt files
#
# Note:
# Patient-level genomic data are not included in this repository.

# Display the header and first variant record
head -2 278unique-sort.variants.combined.annovar.vcf.hg19_multianno.txt
head -2 3347unique-sort.variants.combined.annovar.vcf.hg19_multianno.txt
head -2 MM47unique-sort.variants.combined.annovar.vcf.hg19_multianno.txt

# Obtain a rough count of records in each multianno file
wc -l *_multianno.txt

# Display the header fields with numbered column positions
head -1 278unique-sort.variants.combined.annovar.vcf.hg19_multianno.txt \
    | tr '\t' '\n' \
    | nl

head -1 3347unique-sort.variants.combined.annovar.vcf.hg19_multianno.txt \
    | tr '\t' '\n' \
    | nl

head -1 MM47unique-sort.variants.combined.annovar.vcf.hg19_multianno.txt \
    | tr '\t' '\n' \
    | nl
