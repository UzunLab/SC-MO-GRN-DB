# Load necessary library
library(data.table)

# Define the input file path
input_file <- "tf_gene_symbols_unique.txt"

# Read the unique text file into a data table
data <- fread(input_file, header = FALSE, sep = "\t")

# Extract unique values from the first column (TF names)
unique_tf_names <- unique(data[[1]])

# Print the unique TF names
print(unique_tf_names)

# Write the unique TF names to a separate file
write.table(unique_tf_names, file = "unique_tf_names.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

cat("Unique TF names file created: unique_tf_names.txt\n")

