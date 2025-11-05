# Load necessary libraries
library(edgeR)
library(data.table)

# Function to process a single BED file
process_bed_file <- function(bed_file_path) {
  # Read the BED file
  bed_data <- fread(bed_file_path, header = FALSE)
  
  # Extract chromosome and center coordinate
  chr <- bed_data[[1]]
  locus <- bed_data[[2]]
  
  # Call the nearestTSS function
  nearest_tss_results <- nearestTSS(chr = chr, locus = locus, species = "Hs")
  
  # Add a column for the file name
  nearest_tss_results$file <- basename(bed_file_path)
  
  return(nearest_tss_results)
}

# Directory containing BED files
bed_directory <- "BED_FILE_DIRECTORY_NAME"

# Get a list of all BED files in the directory
bed_files <- list.files(bed_directory, pattern = "\\.bed$", full.names = TRUE)

# Process each BED file and combine results
all_results <- lapply(bed_files, process_bed_file)

# Combine all results into a single data frame
combined_results <- rbindlist(all_results)

# Save the combined results to a CSV file
write.csv(combined_results, file = "combined_nearest_tss_results.csv", row.names = FALSE)

