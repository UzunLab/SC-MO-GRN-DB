# Load necessary library
library(data.table)

# Define the input and output file paths
input_file <- "tf_gene_symbols.txt"
output_file <- "tf_gene_symbols_unique.txt"

# Read the existing text file into a data table
data <- fread(input_file, header = FALSE, sep = "\t")

# Remove duplicate rows
unique_data <- unique(data)

# Write the unique data back to a new text file
write.table(unique_data, file = output_file, quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

cat("Unique text file created:", output_file, "\n")

