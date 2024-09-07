## code to prepare `AJS_AmTiman` dictionary goes here
# This first creates an AJS_AmTiman_dict.xlsx from AJS_AmTiman.xlsx
# Then it creates creates an .rda format of the AJS_AmTiman_dict.xlsx file

# # Define the path to the Excel file in inst/extdata
# import_path <- system.file("extdata", "AJS_AmTiman.xlsx", package = "appliedepidata")
# 
# # Define the path to export the Excel file (Dictionary) to in inst/extdata
# export_path <- file.path("inst", "extdata", "AJS_AmTiman_dict.xlsx")
# 
# 
# # Read in the Excel file using rio
# AJS_AmTiman <- rio::import(import_path)
# 
# 
# # create variable list 
# survey <- datadict::dict_from_data(AJS_AmTiman)
# # add in a notes column that can then be edited manually to describe variables
# survey$note <- NA
# 
# # create list of variable values (choices)
# choices <- datadict::coded_options(survey)
# 
# # chuck in list 
# data_export <- list(
#   survey, 
#   choices
# )
# 
# 
# # write to excel sheet 
# rio::export(data_export, export_path)
#             
            