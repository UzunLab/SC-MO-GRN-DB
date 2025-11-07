# Single-cell multiomics gene regulatory network database

<img width="2274" height="372" alt="image" src="https://github.com/user-attachments/assets/712f7dc0-7471-464c-ab8d-270128b6145b" />
A comprehensive molecular data repository for constructing and validating GRNs using data from single-cell multi-omics datasets. The goal of the platform is to provide a data and knowledge repository for investigators who aim to build, benchmark, and explore gene regulatory networks with single-cell multi-omics data. https://scmogrndb.psu.edu/

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
