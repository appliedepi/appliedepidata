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



#' @title Fake data for a mortality survey
#'
#' @description
#' This is an example fake dataset of a mortality survey which was generated 
#' using [epidict](https://r4epi.github.io/epidict/index.html) package functions. 
#'  
#' @details
#' This is a fake survey dataset. This data has been merge, and differs from the 
#' original which data comes in two parts: a household level dataset ('Mortality Survey') 
#' and an individual level dataset ('hh_member'). 
#' It can be used together with \link{survey_dict}. 
#' Please note, that this data is entirely fictional created based on the 
#' Doctors without Borders (MSF) ethical review board pre-approved survey 
#' dictionaries. They have been generated here exclusively for training purposes.
#'  
#' @source This data was generated with functions from the 
#' [epidict](https://r4epi.github.io/epidict/index.html) package which was created 
#' as part of the R4Epis project funded by the Doctors Without Borders (MSF) 
#' sappling nursery.
#' 
#' The original dataset is 'survey_data.xlsx' 
#'   
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [GPL3](https://www.gnu.org/licenses/gpl-3.0.html) 
#' 
#' @format A data frames with 1000 rows and 55 columns
#' 
#' @docType data
"survey_data"


#' @title Fake data dictionary for a mortality survey
#'
#' @description
#' This is an example fake data dictionary for a mortality survey which was generated 
#' using [epidict](https://r4epi.github.io/epidict/index.html) package functions. 
#'  
#' @details
#' This is a fake data dictionary for the \link{survey_data} dataset.
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
#' @format A dataframe with 46 rows and 14 columns
#' 
#' @docType data
"survey_dict"




#' @title Fake population data for a mortality survey
#'
#' @description
#' This is an example fake population data for a mortality survey which was generated 
#' using [epidict](https://r4epi.github.io/epidict/index.html) package functions. 
#'  
#' @details
#' This is a fake population data for the \link{survey_data} dataset.
#' Please note, that this data is entirely fictional created based on the 
#' Doctors without Borders (MSF) ethical review board pre-approved survey 
#' dictionaries. They have been generated here exclusively for training purposes.
#'  
#' @source This data was generated with functions from the 
#' [epidict](https://r4epi.github.io/epidict/index.html) package which was created 
#' as part of the R4Epis project funded by the Doctors Without Borders (MSF) 
#' sappling nursery.
#' 
#' The original dataset is 'population.xlsx' 
#'   
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [GPL3](https://www.gnu.org/licenses/gpl-3.0.html) 
#' 
#' @format A dataframe with 20 rows and 5 columns
#' 
#' @docType data
"population"