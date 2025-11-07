############################################################
# Usage:
#   Rscript Step_04.List_Unique_TFs.R input_txt_file output_txt_file
# Example:
#   Rscript Step_04.List_Unique_TFs.R tf_gene_symbols_unique.txt unique_tf_names.txt
############################################################

# Load necessary library
library(data.table)

# Define the input file path
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

# Read the unique text file into a data table
data <- fread(input_file, header = FALSE, sep = "\t")

# Extract unique values from the first column (TF names)
unique_tf_names <- unique(data[[1]])

# Write the unique TF names to a separate file
write.table(unique_tf_names,
            file = output_file,
            quote = FALSE,
            sep = "\t",
            row.names = FALSE,
            col.names = FALSE)

cat("Unique TF names file created:", output_file, "\n")
