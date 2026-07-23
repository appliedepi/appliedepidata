## code to prepare `case_linelists_linelist_cleaned_excel` dataset goes here - THIS IS THE EXCEL VERSION

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "case_linelists_linelist_cleaned.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
case_linelists_linelist_cleaned_excel <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this data is a cleaned version of case_linelists_linelist_raw.xlsx, same
## content as linelist_cleaned_excel, repackaged under the case_linelists_ naming
## for this bundle. The cleaning steps are in the epirhandbook cleaning chapter

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(case_linelists_linelist_cleaned_excel, overwrite = TRUE)
