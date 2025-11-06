# Single-cell multiomics gene regulatory network database

<img width="2274" height="372" alt="image" src="https://github.com/user-attachments/assets/712f7dc0-7471-464c-ab8d-270128b6145b" />
A comprehensive molecular data repository for constructing and validating GRNs using data from single-cell multi-omics datasets. The goal of the platform is to provide a data and knowledge repository for investigators who aim to build, benchmark, and explore gene regulatory networks with single-cell multi-omics data. https://scmogrndb.psu.edu/

## Example input
The input for this are bed files from TF ChIP-seq experiments. Here, we provide 5 bed files within the K562 cell line as downloaded from this paper https://doi.org/10.1093/nar/gkad614

These bed files contain the chromosome number, peak center coordinate, and peak number.
```txt
chr1    26100   RUNX1-human_K562_SE-peaks_peak_1
chr1    29324   RUNX1-human_K562_SE-peaks_peak_2
chr1    36533   RUNX1-human_K562_SE-peaks_peak_3
chr1    36761   RUNX1-human_K562_SE-peaks_peak_4
chr1    133122  RUNX1-human_K562_SE-peaks_peak_5
chr1    136807  RUNX1-human_K562_SE-peaks_peak_6
chr1    199866  RUNX1-human_K562_SE-peaks_peak_7
chr1    203159  RUNX1-human_K562_SE-peaks_peak_8
chr1    204893  RUNX1-human_K562_SE-peaks_peak_9
chr1    207067  RUNX1-human_K562_SE-peaks_peak_10
```

The bed files were placed into one directory named TF_CHIP_BED_FILES
[`TF_CHIP_BED_FILES`](TF_CHIP_BED_FILES)

## Linking TF to TGs from raw bed files
1. Place all bed files of a single tissue/cell type into a single directory
2. Insert the bed file directory name into [Step_01.Find_Nearest_Genes.R](SC_MO_GRN_DB_SCRIPTS/Step_01.Find_Nearest_Genes.R) where prompted
3. Run all steps in order

```console
Rscript Step_01.Find_Nearest_Genes.R
Rscript Step_02.Link_TFs_to_Targets.R
Text file created: tf_gene_symbols.txt
Rscript Step_03.Remove_Duplicate_Edges.R
Unique text file created: tf_gene_symbols_unique.txt
Rscript Step_04.List_Unique_TFs.R
[1] "EGR1"  "FOS"   "FOXA1" "MYC"   "RUNX1"
Unique TF names file created: unique_tf_names.txt
Rscript Step_05.Format_Reference_Network.R
Final text file created: tf_gene_symbols_final.txt
```

## Example output
The output file will be named tf_gene_symbols_final.txt and it will look like this:
```txt
Source  Target          Relationship
EGR1    DDX11L1         Transcriptional_Regulation
EGR1    WASH7P          Transcriptional_Regulation
EGR1    MIR1302-11      Transcriptional_Regulation
EGR1    FAM138F         Transcriptional_Regulation
EGR1    OR4F5           Transcriptional_Regulation
EGR1    LOC729737       Transcriptional_Regulation
EGR1    FAM138D         Transcriptional_Regulation
EGR1    LOC100132062    Transcriptional_Regulation
EGR1    LOC101928626    Transcriptional_Regulation
```
