#!/bin/bash

# Stage 5: Preparation of variants for CADD scoring
#
# Purpose:
# Convert RetNet-filtered variants into a VCF-like five-column format
# suitable for submission to the CADD web interface.
#
# Input:
# RetNet-filtered variant table
#
# Output:
# Five-column CADD submission file containing:
# chromosome, position, ID, reference allele and alternate allele
#
# CADD scoring was subsequently performed externally using:
# Genome build: GRCh37
# CADD version: v1.7

# Remove the ANNOVAR header and extract the required variant fields
awk -F '\t' 'BEGIN {OFS="\t"} NR>1 {print $1, $2, ".", $4, $5}' \
    278_03_RetNet.txt \
    > 278_for_CADD.vcf

awk -F '\t' 'BEGIN {OFS="\t"} NR>1 {print $1, $2, ".", $4, $5}' \
    3347_03_RetNet.txt \
    > 3347_for_CADD.vcf

awk -F '\t' 'BEGIN {OFS="\t"} NR>1 {print $1, $2, ".", $4, $5}' \
    MM47_03_RetNet.txt \
    > MM47_for_CADD.vcf
