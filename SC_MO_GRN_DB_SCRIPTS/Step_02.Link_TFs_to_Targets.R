#############################################################
# Usage:
#   Rscript Step_02.Link_TFs_to_Targets.R input_csv_file output_txt_file
# Example:
#   Rscript Step_02.Link_TFs_to_Targets.R combined_nearest_tss_results.csv tf_gene_symbols.txt
#############################################################

# Load necessary library
library(data.table)

# Define the CSV file path
args <- commandArgs(trailingOnly = TRUE)
csv_file <- args[1]      # Input CSV
output_file <- args[2]   # Output TXT

# Read the CSV file into a data table
data <- fread(csv_file)

# Extract TF names from the 'file' column
data[, TF := sub("-.*", "", file)]

# Create the desired text file with TF names and gene symbols
write.table(data[, .(TF, symbol)],
            file = output_file,
            quote = FALSE,
            sep = "\t",
            row.names = FALSE,
            col.names = FALSE)

cat("Text file created:", output_file, "\n")
