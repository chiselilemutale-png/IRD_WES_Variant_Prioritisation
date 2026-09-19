#!/bin/bash

# Stage 8: Integration of annotation, CADD and genotype information
#
# Purpose:
# Merge the RetNet-filtered ANNOVAR annotations with the CADD >30
# results and genotype/zygosity information.
#
# Variant matching:
# Records were matched using chromosome, position, reference allele
# and alternate allele.
#
# Chromosome labels were normalised by removing any existing "chr"
# prefix and then adding a consistent "chr" prefix before matching.
#
# Inputs:
# - CADD >30 candidate table
# - Labelled genotype/zygosity table
# - RetNet-filtered ANNOVAR table
#
# Output:
# Final integrated candidate table containing the original ANNOVAR
# annotations together with CADD PHRED, GT, DP and zygosity.
# SAMPLE 278
awk 'BEGIN{FS=OFS="\t"}

function chrnorm(x) {
    sub(/^chr/, "", x)
    return "chr" x
}

FILENAME=="278_04_CADDgt30.txt" {
    if ($0 ~ /^#/) next
    key=chrnorm($1) ":" $2 ":" $3 ":" $4
    cadd[key]=$6
    next
}

FILENAME=="278_05_Zygosity_labelled.txt" {
    if (FNR==1) next
    key=chrnorm($1) ":" $2 ":" $3 ":" $4
    gt[key]=$5
    dp[key]=$6
    zyg[key]=$7
    next
}

FILENAME=="278_03_RetNet.txt" {
    if (FNR==1) {
        print $0,"CADD_PHRED","GT","DP","Zygosity"
        next
    }

    key=chrnorm($1) ":" $2 ":" $4 ":" $5

    if ((key in cadd) && (key in gt)) {
        print $0,cadd[key],gt[key],dp[key],zyg[key]
    }
}
' \
278_04_CADDgt30.txt \
278_05_Zygosity_labelled.txt \
278_03_RetNet.txt \
> 278_Final.txt

# SAMPLE 33347
awk 'BEGIN{FS=OFS="\t"}

function chrnorm(x) {
    sub(/^chr/, "", x)
    return "chr" x
}

FILENAME=="3347_04_CADDgt30.txt" {
    if ($0 ~ /^#/) next
    key=chrnorm($1) ":" $2 ":" $3 ":" $4
    cadd[key]=$6
    next
}

FILENAME=="3347_05_Zygosity_labelled.txt" {
    if (FNR==1) next
    key=chrnorm($1) ":" $2 ":" $3 ":" $4
    gt[key]=$5
    dp[key]=$6
    zyg[key]=$7
    next
}

FILENAME=="3347_03_RetNet.txt" {
    if (FNR==1) {
        print $0,"CADD_PHRED","GT","DP","Zygosity"
        next
    }

    key=chrnorm($1) ":" $2 ":" $4 ":" $5

    if ((key in cadd) && (key in gt)) {
        print $0,cadd[key],gt[key],dp[key],zyg[key]
    }
}
' \
3347_04_CADDgt30.txt \
3347_05_Zygosity_labelled.txt \
3347_03_RetNet.txt \
> 3347_Final.txt

# SAMPLE MM47
awk 'BEGIN{FS=OFS="\t"}

function chrnorm(x) {
    sub(/^chr/, "", x)
    return "chr" x
}

FILENAME=="MM47_04_CADDgt30.txt" {
    if ($0 ~ /^#/) next
    key=chrnorm($1) ":" $2 ":" $3 ":" $4
    cadd[key]=$6
    next
}

FILENAME=="MM47_05_Zygosity_labelled.txt" {
    if (FNR==1) next
    key=chrnorm($1) ":" $2 ":" $3 ":" $4
    gt[key]=$5
    dp[key]=$6
    zyg[key]=$7
    next
}

FILENAME=="MM47_03_RetNet.txt" {
    if (FNR==1) {
        print $0,"CADD_PHRED","GT","DP","Zygosity"
        next
    }

    key=chrnorm($1) ":" $2 ":" $4 ":" $5

    if ((key in cadd) && (key in gt)) {
        print $0,cadd[key],gt[key],dp[key],zyg[key]
    }
}
' \
MM47_04_CADDgt30.txt \
MM47_05_Zygosity_labelled.txt \
MM47_03_RetNet.txt \
> MM47_Final.txt

