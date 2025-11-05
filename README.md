# Single-cell multiomics gene regulatory network database

<img width="2274" height="372" alt="image" src="https://github.com/user-attachments/assets/712f7dc0-7471-464c-ab8d-270128b6145b" />
A comprehensive molecular data repository for constructing and validating GRNs using data from single-cell multi-omics datasets. The goal of the platform is to provide a data and knowledge repository for investigators who aim to build, benchmark, and explore gene regulatory networks with single-cell multi-omics data. Scripts to build reference networks can be found here.

## Linking TF to TGs from raw bed files
1. Place all bed files of a single tissue/cell type into a single directory
2. Insert the bed file directory name into Step_01.Run_edgeR_nearestTSS.R where prompted
3. Run all steps in order
