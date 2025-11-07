#############################################################
# Usage:
#   Rscript Step_05.Format_Reference_Network.R input_txt_file output_txt_file
# Example:
#   Rscript Step_05.Format_Reference_Network.R tf_gene_symbols_unique.txt tf_gene_symbols_final.txt
#############################################################

# Load necessary library
library(data.table)

# Define the input and output file paths
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

# Read the existing text file into a data table
data <- fread(input_file, header = FALSE, sep = "\t")

# Rename the columns and add the 'Relationship' column
colnames(data) <- c("Source", "Target")
data$Relationship <- "Transcriptional_Regulation"

# Reorder the columns to match the desired output
data <- data[, .(Source, Target, Relationship)]

# Write the modified data to a new text file
write.table(data,
            file = output_file,
            quote = FALSE,
            sep = "\t",
            row.names = FALSE,
            col.names = TRUE)

cat("Final text file created:", output_file, "\n")
