# External Resources

## RetNet inherited retinal disease gene list

The variant-prioritisation workflow incorporated a curated list of genes associated with inherited retinal disease obtained from the Retinal Information Network (RetNet).

RetNet tables were downloaded and processed to extract gene symbols. The gene symbols were combined, sorted and deduplicated to generate the gene list used for intersection with the `Gene.refGene` field of the ANNOVAR-annotated variant files.

The final study-specific list contained 351 IRD-associated genes after mapped loci were excluded.

The RetNet gene list was used as a disease-relevance prioritisation step rather than as evidence that an individual variant was pathogenic. Restricting the analysis to established IRD-associated genes reduced the candidate search space but also limited the subsequent analysis to known disease-associated genes.

## Reproducibility

The shell commands used to process the RetNet resource and perform the gene-list intersection are provided in:

`scripts/04_retnet_intersection.sh`

The RetNet resource and its date of access are reported in the accompanying dissertation.
