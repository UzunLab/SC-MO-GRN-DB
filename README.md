# Single-cell multiomics gene regulatory network database

<img width="2274" height="372" alt="image" src="https://github.com/user-attachments/assets/712f7dc0-7471-464c-ab8d-270128b6145b" />
A comprehensive molecular data repository for constructing and validating GRNs using data from single-cell multi-omics datasets. The goal of the platform is to provide a data and knowledge repository for investigators who aim to build, benchmark, and explore gene regulatory networks with single-cell multi-omics data. https://scmogrndb.psu.edu/

## Scope of this repository

This repository provides a reproducible pipeline for constructing transcription factor–target gene (TF–TG) reference networks from TF ChIP-seq peak data. The generated networks are designed to serve as reference or validation networks for benchmarking gene regulatory network (GRN) inference methods using single-cell multi-omics data.

Raw single-cell data are not reprocessed in this repository. Preprocessing of single-cell modalities (e.g., scRNA-seq, scATAC-seq, scHi-C, scChIP-seq, scDNA methylation, and scCRISPR screening) is performed by the original data generators following modality-specific best practices and is described in the corresponding publications. This repository instead focuses on curation and standardized reference regulatory network construction.

## Reproducibility overview

Reproducing the reference network construction involves the following steps:

1. Obtain TF ChIP-seq peak files processed to peak-center resolution.
2. Run the provided wrapper script to map TF binding events to nearest transcription start sites (TSS).
3. Aggregate and format TF–target relationships into a standardized regulatory network.

All steps are deterministic and require no manual intervention once input files are provided.

## Input data requirements

### TF ChIP-seq peak files

Input peak files must be BED-like text files containing:
- Chromosome
- Peak center coordinate
- Peak identifier

Peak files are expected to be generated from uniformly processed TF ChIP-seq experiments. In the SC-MO-GRN-DB project, peak sets were derived from curated public datasets and processed using standard peak-calling workflows prior to use in this pipeline.

This repository assumes that:
- Peak calling has already been performed
- Peaks represent high-confidence TF binding events
- Coordinates are based on a consistent reference genome

## Example input

The input for this pipeline are peak files from TF ChIP-seq experiments. Here, we provide example peak files for the K562 cell line as obtained from this study: https://doi.org/10.1093/nar/gkad614

These peak files contain the chromosome number, peak center coordinate, and peak number.
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

The peak files were placed into one directory named TF_CHIP_BED_FILES
[`TF_CHIP_BED_FILES`](TF_CHIP_BED_FILES)

## Running the pipeline
1. Before running the pipeline, make sure that all five R scripts and the wrapper script are located in the same directory. The pipeline relies on this structure to run each step automatically.
2. Specify the input and output directories.
```bash
bash Step_00.Link_TF_to_TG.sh <input_bed_directory> <output_directory>
```
- **`<input_bed_directory>`**: The folder containing your BED files.  
- **`<output_directory>`**: The folder where all output files will be saved.

3. Execute the command.
```bash
bash Step_00.Link_TF_to_TG.sh TF_CHIP_BED_FILES results
```
Once the command finishes, the output folder will contain all intermediate and final results, including the fully formatted TF–target network.

## Single-cell dataset curation and preprocessing context

Single-cell multi-omics datasets included in SC-MO-GRN-DB were obtained from established community resources and original publications. All preprocessing steps for these datasets (e.g., alignment, quality control, normalization, peak calling, or contact matrix generation) were performed by the original data generators, following modality-specific best practices described in the corresponding publications.

Our contribution focuses on curating high-quality datasets suitable for GRN benchmarking and inference. Only datasets containing wild-type or untreated control cells were retained to avoid confounding baseline regulatory relationships. When multiple cell types were present, cells were stratified into homogeneous groups using provided metadata, and low-quality cells were excluded to ensure consistency across studies.

Each curated dataset is annotated with organism, tissue or cell type, molecular modality, number of cells, and primary literature reference. Detailed dataset metadata and preprocessing descriptions are provided in the manuscript supplemental tables and are accessible through the SC-MO-GRN-DB web interface.

## Example output
After running the pipeline, the following files are generated in the output directory:

| File                               | Description                                      |
| ---------------------------------- | ------------------------------------------------ |
| `combined_nearest_tss_results.csv` | Combined nearest-gene results from all BED files |
| `tf_gene_symbols.txt`              | TF–gene symbol pairs                             |
| `tf_gene_symbols_unique.txt`       | Duplicate-free TF–gene pairs                     |
| `unique_tf_names.txt`              | List of unique transcription factors             |
| `tf_gene_symbols_final.txt`        | Final formatted reference network                |

Example (tf_gene_symbols_final.txt):
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

## Role in database construction

The TF–target networks generated by this pipeline are incorporated into the SC-MO-GRN-DB platform as reference networks. These networks are used to:

- Benchmark GRN inference methods across single-cell modalities
- Validate inferred regulatory edges
- Enable cross-dataset and cross-modality comparisons

Processed networks are stored in standardized formats to support downstream analysis, visualization, and integration with curated single-cell datasets available through the SC-MO-GRN-DB web interface.
