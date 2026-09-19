#!/bin/bash

# Stage 4: RetNet gene-list intersection
#
# Purpose:
# Restrict the prioritised variants to genes included in the
# study-specific RetNet inherited retinal disease gene list.
#
# RetNet resource:
# RetNet_351_genes.txt
#
# The gene list contained 351 IRD-associated genes.
#
# Matching field:
# Column 7 of the ANNOVAR table (Gene.refGene)
#
# Input:
# - RetNet_351_genes.txt
# - Pathogenicity-filtered variant table
#
# Output:
# RetNet-restricted variant table

# Inspect the RetNet gene list
head -n 5 RetNet_351_genes.txt

# Retain variants whose Gene.refGene entry occurs in the RetNet gene list
awk -F '\t' 'NR==FNR{genes[$1]=1; next} FNR==1 {print; next} ($7 in genes)' \
    RetNet_351_genes.txt \
    278_02_pathogenicity.txt \
    > 278_03_RetNet.txt

awk -F '\t' 'NR==FNR{genes[$1]=1; next} FNR==1 {print; next} ($7 in genes)' \
    RetNet_351_genes.txt \
    3347_02_pathogenicity.txt \
    > 3347_03_RetNet.txt

awk -F '\t' 'NR==FNR{genes[$1]=1; next} FNR==1 {print; next} ($7 in genes)' \
    RetNet_351_genes.txt \
    MM47_02_pathogenicity.txt \
    > MM47_03_RetNet.txt

# Count records in the RetNet-filtered output files
wc -l *_03_RetNet.txt
