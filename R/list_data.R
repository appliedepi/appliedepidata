#' @title List Datasets in a Package
#'
#' @description
#' This function lists all the files in the `data`,`inst/extdata` and 
#' `internal binaries` directories of a specified R package.
#'
#' @param package_name A character string specifying the name of the R package 
#' for which to list files. Defaults to "appliedepidata". 
#' 
#' @return A data frame with four columns:
#' \describe{
#'   \item{`directory`}{The directory (`data`,`extdata`, `intdata`) where the 
#'   file is located.}
#'   \item{`name`}{The name for each dataset found in directories.}
#'   \item{`extension`}{The file extension for each dataset found in directories}
#'   \item{`duplicate`}{Logical vector (TRUE/FALSE) if the file name (with 
#'   extension) exists more than once. Only flags from the second occurrence. 
#'   This is useful for packages which have not been built making .rda files 
#'   internal}
#' }
#' 
#' @importFrom tidyr separate_wider_delim
#'
#' @examples
#' \dontrun{
#' # List all files in the directories of the "ggplot2" package
#' files <- list_data(package_name = "ggplot2")
#' print(files)
#' }
#'
#' @export
list_data <- function(package_name = "appliedepidata") {
  
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
    data_files <- data.frame(
      directory = "data", 
      name = dir(data_path)
    )
  } else {
    data_files <- NULL
    message("No data directory found in the package.")
  }
  
  # List data in the inst directory
  if (dir.exists(extdata_path)) {
    extdata_files <- data.frame(
      directory = "extdata",
      name = dir(extdata_path)
    )
  } else {
    extdata_files <- NULL
    message("No inst directory found in the package.")
  }
  
  # List internal data 
  if(nrow(data(package = package_name)$results) > 0) {
    intdata_files <- data.frame(
      directory = "intdata", 
      name = paste0(
        data(package = package_name)$results[, "Item"], 
        ".rda"
      )
    )
  } else {
    intdata_files <- NULL
    message("No internal data found in the package")
  }
  
  
  # combine dataframes 
  available_data <- rbind(data_files, extdata_files, intdata_files)
  
  # remove binaries listed in data folder (this is for pkgs where data internalised)
  available_data <- available_data[!(available_data$name %in% c("Rdata.rdb",
                                                                "Rdata.rds",
                                                                "Rdata.rdx")), ]
  
  # flag duplicates 
  available_data$duplicate <- duplicated(available_data$name)
  
  # split file name and extension
  available_data <- tidyr::separate_wider_delim(available_data, 
                                                name, 
                                                ".", 
                                                names = c("name", "extension"))
  
  return(available_data)
}
