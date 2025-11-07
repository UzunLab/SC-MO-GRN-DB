############################################################
# Usage:
#   Rscript Step_03.Remove_Duplicate_Edges.R input_txt_file output_txt_file
# Example:
#   Rscript Step_03.Remove_Duplicate_Edges.R tf_gene_symbols.txt tf_gene_symbols_unique.txt
############################################################

# Load necessary library
library(data.table)

# Read the existing text file into a data table
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

# Read the existing text file into a data table
data <- fread(input_file, header = FALSE, sep = "\t")

# Remove duplicate rows
unique_data <- unique(data)

# Write the unique data back to a new text file
write.table(unique_data,
            file = output_file,
            quote = FALSE,
            sep = "\t",
            row.names = FALSE,
            col.names = FALSE)

cat("Unique text file created:", output_file, "\n")
