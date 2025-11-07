#!/bin/bash
################################################################
# Usage:
#   bash Step_00.Link_TF_to_TG.sh /path/to/BED_FILES /path/to/output_directory
#
# Example:
#   bash run_TF_target_pipeline.sh \
#        /data/TF_CHIP_BED_FILES \
#        /results/TF_TG_Pipeline_Output
#
# Description:
#   This wrapper executes all 5 R scripts in sequence to:
#     1. Find nearest genes for each BED file
#     2. Link TFs to gene symbols
#     3. Remove duplicate TF–target pairs
#     4. List unique TF names
#     5. Format the final reference network file
#
# Output files are stored in the specified output directory.
################################################################

set -e  # Exit immediately on error

BED_DIR="$1"
OUTPUT_DIR="$2"

if [ -z "$BED_DIR" ] || [ -z "$OUTPUT_DIR" ]; then
  echo "Usage: bash Step_00.Link_TF_to_TG.sh /path/to/BED_FILES /path/to/output_directory"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

echo "Running Step 01: Find nearest genes..."
Rscript Step_01.Find_Nearest_Genes.R "$BED_DIR" "$OUTPUT_DIR/combined_nearest_tss_results.csv"

echo "Running Step 02: Link TFs to targets..."
Rscript Step_02.Link_TFs_to_Targets.R \
  "$OUTPUT_DIR/combined_nearest_tss_results.csv" \
  "$OUTPUT_DIR/tf_gene_symbols.txt"

echo "Running Step 03: Remove duplicate edges..."
Rscript Step_03.Remove_Duplicate_Edges.R \
  "$OUTPUT_DIR/tf_gene_symbols.txt" \
  "$OUTPUT_DIR/tf_gene_symbols_unique.txt"

echo "Running Step 04: List unique TF names..."
Rscript Step_04.List_Unique_TFs.R \
  "$OUTPUT_DIR/tf_gene_symbols_unique.txt" \
  "$OUTPUT_DIR/unique_tf_names.txt"

echo "Running Step 05: Format reference network..."
Rscript Step_05.Format_Reference_Network.R \
  "$OUTPUT_DIR/tf_gene_symbols_unique.txt" \
  "$OUTPUT_DIR/tf_gene_symbols_final.txt"

echo "All steps completed successfully!"
echo "Results saved in: $OUTPUT_DIR"
