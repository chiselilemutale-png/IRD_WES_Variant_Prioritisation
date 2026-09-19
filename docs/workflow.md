# Variant Prioritisation Workflow

## Overview

This repository documents the post-annotation bioinformatics workflow used to prioritise candidate variants from whole-exome sequencing (WES) data in three individuals with inherited retinal disease (IRD).

Analysis began from supplied ANNOVAR `hg19_multianno.txt` files and corresponding VCF files. The study did not perform primary sequencing, read alignment or variant calling.

The workflow consisted of sequential filtering and prioritisation followed by genotype retrieval and cross-sample comparison.

## Workflow stages

The principal stages were:

1. Inspection of the supplied ANNOVAR annotation files
2. Population-frequency filtering
3. Functional and in silico prediction filtering
4. Intersection with the RetNet IRD gene list
5. Preparation of retained variants for CADD scoring
6. CADD scoring and threshold comparison
7. Genotype and zygosity retrieval from the corresponding VCF files
8. Integration of annotation, CADD and genotype information
9. Cross-sample comparison of the final prioritised variants

The same filtering logic was applied independently to each sample.

## CADD scoring

Following RetNet intersection, retained variants were reformatted into a
five-column VCF-like file containing chromosome, position, ID, reference
allele and alternate allele.

CADD scoring was performed externally using the CADD web interface
(https://cadd.bihealth.org/score), with GRCh37 and CADD v1.7 selected.

The resulting compressed TSV output was downloaded and returned to the
computational environment for subsequent processing and filtering.

## Genotype and zygosity retrieval

Genotype information was retrieved from the corresponding VCF files using `bcftools`.

Variant coordinates and alleles were used to associate prioritised variants with their VCF records. Genotype information was then incorporated into the prioritised variant tables to support assessment of zygosity and inheritance compatibility.

The exact commands used for genotype extraction and integration are documented in the `scripts` directory.

## Cross-sample comparison

Following integration of annotation, CADD and genotype information, final candidate tables were exported for comparison in Microsoft Excel.

A variant identifier was constructed using:

`chromosome_position_reference_alternate`

This enabled exact variant-level comparison between samples.

Gene-level recurrence and exact variant recurrence were considered separately. This distinction was important because identification of variants within the same gene does not necessarily indicate that the same genomic variant is shared between samples.

## Interpretation

Variants surviving the computational workflow were treated as prioritised candidates rather than confirmed causal variants.

Final interpretation considered the available evidence for:

- gene-disease association
- variant-level evidence
- zygosity
- inheritance compatibility
- consistency with the reported retinal phenotype

Detailed phenotypic, segregation, phase, functional and orthogonal confirmation data were not available. These limitations were therefore considered when determining how far computational evidence could support interpretation.

## Data protection

Patient-level genomic data are not included in this repository.

The repository contains analytical scripts, workflow documentation and parameter definitions intended to support reproducibility without distributing individual-level genomic data.
