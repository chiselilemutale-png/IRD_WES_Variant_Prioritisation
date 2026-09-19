#!/bin/bash

# Stage 6: CADD output processing and threshold filtering
#
# Purpose:
# Process the CADD v1.7 output returned from the web interface and
# evaluate increasingly stringent CADD PHRED thresholds.
#
# CADD settings used:
# - Genome build: GRCh37
# - CADD version: v1.7
#
# Input:
# Compressed CADD output returned by the CADD web interface
#
# Thresholds evaluated:
# - PHRED >10
# - PHRED >20
# - PHRED >30
#
# The >30 threshold was used to define the final high-priority
# candidate set for subsequent genotype/zygosity analysis.

# Decompress the downloaded CADD output while retaining the .gz file
gzip -dk 278_CADD_RAW.tsv.gz

gzip -dk 3347_CADD_RAW.tsv.gz

gzip -dk MM47_CADD_RAW.tsv.gz

# Confirm the downloaded compressed file type
file 278_CADD_RAW.tsv.gz

file 3347_CADD_RAW.tsv.gz

file MM47_CADD_RAW.tsv.gz

# Retain variants with CADD PHRED >10 across all 3 samples
awk -F '\t' 'BEGIN {OFS= "\t"} /^#/ {print; next} $6>10' \
    278_CADD_RAW.tsv \
    > 278_04_CADDgt10.txt

awk -F '\t' 'BEGIN {OFS= "\t"} /^#/ {print; next} $6>10' \
    3347_CADD_RAW.tsv \
    > 3347_04_CADDgt10.txt

awk -F '\t' 'BEGIN {OFS= "\t"} /^#/ {print; next} $6>10' \
    MM47_CADD_RAW.tsv \
    > MM47_04_CADDgt10.txt

# Retain variants with CADD PHRED >20
awk -F '\t' 'BEGIN {OFS= "\t"} /^#/ {print; next} $6>20' \
    278_CADD_RAW.tsv \
    > 278_04_CADDgt20.txt

awk -F '\t' 'BEGIN {OFS= "\t"} /^#/ {print; next} $6>20' \
    3347_CADD_RAW.tsv \
    > 3347_04_CADDgt20.txt

awk -F '\t' 'BEGIN {OFS= "\t"} /^#/ {print; next} $6>20' \
    MM47_CADD_RAW.tsv \
    > MM47_04_CADDgt20.txt

# Retain variants with CADD PHRED >30
awk -F '\t' 'BEGIN {OFS= "\t"} /^#/ {print; next} $6>30' \
    278_CADD_RAW.tsv \
    > 278_04_CADDgt30.txt

awk -F '\t' 'BEGIN {OFS= "\t"} /^#/ {print; next} $6>30' \
    3347_CADD_RAW.tsv \
    > 3347_04_CADDgt30.txt

awk -F '\t' 'BEGIN {OFS= "\t"} /^#/ {print; next} $6>30' \
    MM47_CADD_RAW.tsv \
    > MM47_04_CADDgt30.txt

# Count records retained at each CADD threshold
wc -l *_CADDgt10.txt
wc -l *_CADDgt20.txt
wc -l *_CADDgt30.txt
