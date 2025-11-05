# Load necessary library
library(data.table)

# Define the CSV file path
csv_file <- "combined_nearest_tss_results.csv"

# Read the CSV file into a data table
data <- fread(csv_file)

# Extract TF names from the 'file' column
data[, TF := sub("-.*", "", file)]

# Create the desired text file with TF names and gene symbols
output_file <- "tf_gene_symbols.txt"
write.table(data[, .(TF, symbol)], file = output_file, quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

cat("Text file created:", output_file, "\n")

