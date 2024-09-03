#' @title List Files in a Package
#'
#' @description
#' This function lists all the files in the `data`,`inst/extdata` and 
#' `internal binaries` directories of a #' specified R package.
#'
#' @param package_name A character string specifying the name of the R package 
#' for which to list files. Defaults to "appliedepidata". 

#' @return A data frame with two columns:
#' \describe{
#'   \item{`directory`}{The directory (`data`,`extdata`, `intdata`) where the 
#'   file is located.}
#'   \item{`file`}{The name and file extension for each dataset found in 
#'   directories.}
#'   \item{`duplicate`}{Logical vector (TRUE/FALSE) if the file name exists 
#'   more than once. Only flags from the second occurrence. This is useful for
#'   packages which have not been built making .rda files internal}
#' }
#'
#' @examples
#' \dontrun{
#' # List all files in the data and inst directories of the "ggplot2" package
#' files <- list_datasets(package_name = "ggplot2")
#' print(files)
#' }
#'
#' @export
list_datasets <- function(package_name = "appliedepidata") {
  
  if (is.null(package_name)) {
    stop("Please specify a package name")
  }
  
  if (system.file(package = package_name) == "") {
    stop("Package not found. Please ensure the package is installed.")
  }
  
  # Define the paths to the data and inst folders
  data_path    <- system.file("data", package = package_name)
  extdata_path <- system.file("extdata", package = package_name)
  
  # List data in the data directory
  if (dir.exists(data_path)) {
    data_files <- dir(data_path)
  } else {
    data_files <- NULL
    message("No data directory found in the package.")
  }
  
  # List data in the inst directory
  if (dir.exists(extdata_path)) {
    extdata_files <- dir(extdata_path)
  } else {
    extdata_files <- NULL
    message("No inst directory found in the package.")
  }
  
  # List internal data 
  if(nrow(data(package = package_name)$results) > 0) {
    intdata_files <- data(package = package_name)$results[, "Item"]
    intdata_files <- paste0(intdata_files, ".rda")
  } else {
    intdata_files <- NULL
    message("No internal data found in the package")
  }
  
  
  # combine lists 
  file_type <- c(rep.int("data", length(data_files)), 
                 rep.int("extdata", length(extdata_files)), 
                 rep.int("intdata", length(intdata_files)))
  file_names <- c(data_files, extdata_files, intdata_files)
  
  # put in a dataframe 
  available_data <- data.frame(
    directory = file_type, 
    file = file_names
  )
  
  # remove binaries listed in data folder (this is for pkgs where data internalised)
  available_data <- available_data[!(available_data$file %in% c("Rdata.rdb",
                                                                "Rdata.rds",
                                                                "Rdata.rdx")), ]
  
  # flag duplicates 
  available_data$duplicate <- duplicated(available_data$file)
  
  return(available_data)
}
