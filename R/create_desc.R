#' @title Create Description of Variables for Roxygen Documentation
#'
#' @description
#' This function uses a data frame (in a data dictionary format) to create a the 
#' description section of 'format' for data set documentation with the Roxygen 
#' package. 
#'
#' @param dictionary A data frame listing at minimum the variable name, variable
#' type and a description column. 
#' @param variable_name A column listing the names of variables
#' @param type A column listing the type of variable 
#' @param description A column explaining what the variable contains
#' @param copy_to_clipboard if `TRUE` (default), the description text will be
#'   copied to the user's clipboard with [clipr::write_clip()]. If `FALSE`, it 
#'   will be printed to the user's console.
#' 
#' @importFrom clipr write_clip
#' 
#' @return A character string which can be pasted in to the documentation file
#'
#' @examples
#' \dontrun{
#' # Create description text for ... 
#' create_desc(data_dict, "variable_name", "type", "description")
#' }
#' 
#' @export

create_desc <- function(dictionary, variable_name, type = NULL, description, 
                        copy_to_clipboard = TRUE) {
  
  # Check if dictionary is a data frame
  if (!is.data.frame(dictionary)) {
    stop("The 'dictionary' argument must be a data frame.")
  }
  
  # Check if required columns are present in the dictionary
  required_columns <- c(variable_name, description)
  if (!all(required_columns %in% colnames(dictionary))) {
    missing_cols <- setdiff(required_columns, colnames(dictionary))
    stop("The 'dictionary' data frame is missing the following required columns: ", 
         paste(missing_cols, collapse = ", "))
  }
  
  # Initialize the describe block with #' at the beginning
  describe_block <- "#' \\describe{\n"
  
  # Loop over each row in the dictionary and append formatted variable descriptions
  for (i in seq_len(nrow(dictionary))) {
    # Get the variable name, type, and description for the current row
    var_name <- dictionary[[variable_name]][i]
    var_desc <- dictionary[[description]][i]
    var_type <- dictionary[[type]][i]
    
    # Check if var_name and var_desc are valid
    if (is.na(var_name) || var_name == "") {
      warning("Warning: Variable name at row ", i, " is missing or empty.")
      next
    }
    
    # If no description is provided in the dictionary, set a default message
    if (is.na(var_desc) || var_desc == "") {
      var_desc <- "No description available"
    }
    
    # If no type is provided in the dictionary, format the description accordingly
    if (is.na(var_type) || var_type == "" || var_type == "Unknown") {
      # Append to the describe block without type information
      describe_block <- paste0(describe_block, "#'   \\item{", var_name, "}{", var_desc, "}\n")
    } else {
      # Append to the describe block with type information and "a" before type
      describe_block <- paste0(describe_block, "#'   \\item{", var_name, "}{a ", var_type, " denoting ", var_desc, "}\n")
    }
  }
  
  # Close the describe block with #' and append it
  describe_block <- paste0(describe_block, "#' }\n")
  
  # add output to clipboard
  if (copy_to_clipboard) {
    x <- try(clipr::write_clip(describe_block), silent = TRUE)
    if (inherits(x, "try-error")) {
      if (interactive()) cat(describe_block)
      return(invisible())
    }
    message("Copied to clipboard. Paste the contents to your documentation file")
  } else {
    cat(describe_block)
  }
  
}
