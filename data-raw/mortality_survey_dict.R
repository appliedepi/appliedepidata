## code to prepare `mortality_survey_dict` dataset goes here
# This creates an .rda format of the mortality_survey_dict.xlsx file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "mortality_survey_dict.xlsx", package = "appliedepidata")

# read in the dictionary in merged - long format 
mortality_survey_dict <- epidict::msf_dict_survey(name = file_path, 
                                                  template = FALSE, 
                                                  compact = FALSE, 
                                                  long = TRUE)


usethis::use_data(mortality_survey_dict, overwrite = TRUE)
