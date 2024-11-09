#' @title Linelist data of Campylobacter surveillance in Germany 2001-2011.
#'
#' @description
#' Linelist data of Campylobacter surveillance in Germany 2001-2011.
#'  
#' @details
#' Weekly number of reported campylobacteriosis cases in Germany, 2002-2011.
#'  
#' @source This data was originally added to the {surveillance} package, we have 
#' removed the last 13 rows of data and only kept date and cases variables. 
#' The data on campylobacteriosis cases have been queried from the "SurvstatRKI" 
#' database of the German Robert Koch Institute (https://survstat.rki.de/).
#' 
#' The original dataset can be accessed using data("CampyDe"). Within
#' this package the original dataset is campylobacter_germany.xlsx
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [GPL3](https://www.gnu.org/licenses/gpl-3.0.html) 
#' 
#' @references {Manitz, J. and Höhle, M. (2013): Bayesian outbreak detection algorithm for monitoring reported cases of campylobacteriosis in Germany. Biometrical Journal, 55(4), 509-526} \doi{10.1002/bimj.201200141}
#' 
#' @format A data frame with 509 rows and 2 columns
#' 
#' @docType data
"campylobacter_germany"




#' @title Weather data for Germany from 2001-2011
#'
#' @description
#' Weather data for Germany from 2001-2011
#'  
#' @details
#' Weather data for Germany from 2001-2011
#'  
#' @source This data was obtained using the {ecmwfr} package as described in the 
#' epiRhandbook chapter on timeseries. This data was originally collected with the 
#' European Union Copernicus satelite and made available on their 
#' [climate data store](https://cds.climate.copernicus.eu/datasets/derived-era5-land-daily-statistics?tab=overview)
#' 
#' The original dataset is germany_weather.zip
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [GPL3](https://www.gnu.org/licenses/gpl-3.0.html) 
#' 
#' @format A list
#' 
#' @docType data
"germany_weather"