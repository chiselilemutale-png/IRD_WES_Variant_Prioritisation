#!/bin/bash

# Stage 7: Genotype and zygosity extraction
#
# Purpose:
# Extract genotype (GT) and read depth (DP) information from the
# corresponding VCF file and assign descriptive zygosity labels.
#
# Software:
# bcftools v1.23.1
#
# Input:
# Supplied sample VCF
#
# Output:
# Tab-delimited genotype table containing:
# chromosome, position, reference allele, alternate allele,
# genotype, read depth and zygosity.

# Load bcftools in the HPC environment
module load apps/bcftools/1.23.1/gcc-8.5.0

# Extract genotype and read-depth information from the VCF
bcftools query \
    -f '%CHROM\t%POS\t%REF\t%ALT[\t%GT\t%DP]\n' \
    278unique-sort.variants.combined.vcf \
    > 278_05_zygosity_raw.txt

# Inspect the extracted genotype information
head -5 278_05_zygosity_raw.txt

head -5 3347_05_zygosity_raw.txt

head -5 MM47_05_zygosity_raw.txt

# Assign descriptive zygosity labels
awk 'BEGIN{
    OFS="\t";
    print "Chr","Start","Ref","Alt","GT","DP","Zygosity"
}
{
    if ($5=="0/1" || $5=="1/0")
        z="Heterozygous";
    else if ($5=="1/1")
        z="Homozygous_Alt";
    else
        z="Other";

    print $1,$2,$3,$4,$5,$6,z
}' \
    278_05_zygosity_raw.txt \
    > 278_05_Zygosity_labelled.txt

# Repeat for sample 3347 and MM47

# Inspect the labelled output
head -3 *_05_Zygosity_labelled.txt
