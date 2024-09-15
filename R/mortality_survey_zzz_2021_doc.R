#' @title Fake data for a mortality survey
#'
#' @description
#' This is an example fake dataset of a mortality survey which was generated 
#' using [epidict](https://r4epi.github.io/epidict/index.html) package functions. 
#'  
#' @details
#' This is a fake survey dataset. This data comes in two parts: 
#' a household level dataset ('Mortality Survey') and an individual 
#' level dataset ('hh_member'). It can be used together with \link{mortality_survey_dict}. 
#' Please note, that this data is entirely fictional created based on the 
#' Doctors without Borders (MSF) ethical review board pre-approved survey 
#' dictionaries. They have been generated here exclusively for training purposes.
#'  
#' @source This data was generated with functions from the 
#' [epidict](https://r4epi.github.io/epidict/index.html) package which was created 
#' as part of the R4Epis project funded by the Doctors Without Borders (MSF) 
#' sappling nursery.
#' 
#' The original dataset is 'mortality_survey_data.xlsx' 
#'   
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [GPL3](https://www.gnu.org/licenses/gpl-3.0.html) 
#' 
#' @format Two data frames, 'Mortality Survey' with 424 rows and 16 columns, and 
#' 'hh_member' with 2874 rows and 24 columns:
#' 
#' \describe{
#'   \item{Mortality Survey}{A data frame with 424 rows and 16 columns:
#'     \describe{
#'       \item{variable1}{Description of variable1}
#'       \item{variable2}{Description of variable2}
#'       # Add more variables as needed
#'     }
#'   }
#'   \item{hh_member}{A data frame with 2874 rows and 24 columns:
#'     \describe{
#'       \item{variable1}{Description of variable1}
#'       \item{variable2}{Description of variable2}
#'       # Add more variables as needed
#'     }
#'   }
#' }
#' 
#' @docType data
"mortality_survey_data"





#' @title Fake data dictionary for a mortality survey
#'
#' @description
#' This is an example fake data dictionary for a mortality survey which was generated 
#' using [epidict](https://r4epi.github.io/epidict/index.html) package functions. 
#'  
#' @details
#' This is a fake data dictionary for the \link{mortality_survey_data} dataset.
#' This data dictionary was originally in ODK excel format and using functions 
#' from [epidict](https://r4epi.github.io/epidict/index.html) was transformed in
#' to long format, so that it can be used for recoding using the 
#' [matchmaker](https://www.repidemicsconsortium.org/matchmaker/) package. 
#' Please note, that this data is entirely fictional created based on the 
#' Doctors without Borders (MSF) ethical review board pre-approved survey 
#' dictionaries. They have been generated here exclusively for training purposes.
#'  
#' @source This data was generated with functions from the 
#' [epidict](https://r4epi.github.io/epidict/index.html) package which was created 
#' as part of the R4Epis project funded by the Doctors Without Borders (MSF) 
#' sappling nursery.
#' 
#' The original dataset is 'mortality_survey_dict.xlsx' 
#'   
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [GPL3](https://www.gnu.org/licenses/gpl-3.0.html) 
#' 
#' @format Two data frames, 'Mortality Survey' with 424 rows and 16 columns, and 
#' 'hh_member' with 2874 rows and 24 columns:
#' 
#' @docType data
"mortality_survey_dict"