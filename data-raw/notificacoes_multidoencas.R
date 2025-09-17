## code to prepare `notificacoes_multidoencas` dataset goes here

# This creates an .rda format of the notificacoes_multidoencas.xlxs file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "notificacoes_multidoencas.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
notificacoes_multidoencas <- rio::import(file_path)

usethis::use_data(notificacoes_multidoencas, overwrite = TRUE)
