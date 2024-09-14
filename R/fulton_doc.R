#' @title Anonymized COVID-19 linelist data from Fulton County (USA), 2020
#'
#' @description
#' Anonymized and jittered linelist data from the real emergence of COVID-19 in 
#' Fulton County, with sample dates from early 2020 to July 2021. 
#'  
#' @details
#' This is a case-linelist which contains de-indentified individual level data 
#' on clinical, laboratory and epidemiological information. It can be used 
#' together with \link{fulton_population} (population data by county). 
#' 
#' Please note, that some data has been adapted in order to best achieve
#' training objectives. Also, the GPS coordinates included in the dataset
#' do not correspond to real cases identified during this outbreak.
#' They have been generated exclusively for training purposes.
#'  
#' @source This data was collected by Fulton County for surveillance purposes, then anonymized and jittered for training. 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @docType data
"fulton_data"




#' @title Clean anonymized COVID-19 linelist data from Fulton County (USA), 2020
#'
#' @description
#' Anonymized and jittered linelist data from the real emergence of COVID-19 in 
#' Fulton County, with sample dates from early 2020 to July 2021. This data has been
#' cleaned to standardise column names and content, format column classes, and remove erroneous data. 
#'  
#' @details
#' This is a case-linelist which contains de-indentified individual level data 
#' on clinical, laboratory and epidemiological information. It is the clean version of 
#' \link{fulton_data} and can be used together with \link{fulton_population} (population data by county). 
#' 
#' Please note, that some data has been adapted in order to best achieve
#' training objectives. Also, the GPS coordinates included in the dataset
#' do not correspond to real cases identified during this outbreak.
#' They have been generated exclusively for training purposes.
#'  
#' @source This data was collected by Fulton County for surveillance purposes, then anonymized and jittered for training. 
#' 
#' This is version 2.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @docType data
"fulton_data_clean"


#' @title Zip population data Fulton County (USA), 2020
#'
#' @description
#' Table of population size per zip code in Fulton County (USA), 2020
#'  
#' @details
#' This is an aggregate dataset with population size per zip code in Fulton County (USA), 2020.
#' It can be used together with \link{fulton_data} or \link{fulton_data_clean}, which are raw and
#' clean versions of COVID-19 linelist data for Fulton County respectively. 
#' 
#' Please note, that some data has been adapted in order to best achieve
#' training objectives. 
#'  
#' @source This population data was provided by Fulton County for training purposes. 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @docType data
"fulton_population"