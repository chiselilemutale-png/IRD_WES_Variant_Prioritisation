# IRD_WES_Variant_Prioritisation
Reproducible bioinformatics workflow for priorisation of candidate variants

This repository contains the computational workflow used for an MSc Bioinformatics and Genomic Medicine dissertation investigating candidate variant prioritisation in inherited retinal disease (IRD).

## Study overview

The workflow was applied to previously generated and annotated whole-exome sequencing data. Analysis began from ANNOVAR `hg19_multianno.txt` files and corresponding VCF files aligned to GRCh37/hg19.

The workflow focused on post-annotation variant prioritisation rather than primary sequencing, alignment or variant calling.

## Workflow

The principal analytical stages were:

1. Inspection of supplied ANNOVAR annotations
2. Population-frequency filtering
3. Functional and in silico prediction filtering
4. Intersection with the RetNet IRD gene list
5. Preparation of variants for CADD scoring
6. Comparison of CADD PHRED thresholds
7. Genotype extraction from supplied VCF files
8. Integration of annotation, CADD and genotype information
9. Cross-sample comparison of prioritised candidates

## Key prioritisation criteria

- Genome build: GRCh37/hg19
- Population frequency: `1000g2012apr_all < 0.01`
- Functional consequence: protein-altering exonic variants retained in the study
- In silico prediction: retention when at least one specified SIFT, PolyPhen-2 HDIV or MutationTaster criterion was satisfied
- Disease-gene restriction: RetNet IRD gene list
- CADD: PHRED thresholds of 10, 20 and 30 evaluated; >30 used for the high-priority candidate set
- Zygosity: retrieved from the corresponding VCF files using bcftools

## Software and command-line utilities

The workflow used:

- ANNOVAR-annotated input files
- bcftools
- awk
- sort
- uniq
- sed
- head
- wc
- CADD web interface
- Microsoft Excel for documented final cross-sample comparisons

## Data availability and privacy

Patient-level genomic data are not included in this repository.

The repository contains the computational workflow and documentation required to describe the analytical process without distributing individual-level genomic data.

## Important interpretation note

This workflow was designed for research-based candidate variant prioritisation. Survival through the filtering pipeline does not establish pathogenicity or constitute a clinical molecular diagnosis.
