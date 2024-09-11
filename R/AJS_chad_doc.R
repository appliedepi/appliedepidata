#' @title Linelist data from an outbreak of Acute Jaundice Syndrome (AJS) in Chad 2016
#'
#' @description
#' Linelist data from a real outbreak of Hepatitis E virus (HEV) infection which
#' occurred in the town of Am Timan, Chad, between October 2016 and
#' April 2017. 
#'  
#' @details
#' This is a case-linelist which contains de-indentified individual level data 
#' on clinical, laboratory and epidemiological information. It can be used 
#' together with \link{AJS_AmTiman_population}, \link{Blocksshape} and 
#' \link{Quartiersshape}. 
#' Please note, that some data has been adapted in order to best achieve
#' training objectives. Also, the GPS coordinates included in the dataset
#' do not correspond to real cases identified during this outbreak.
#' They have been generated exclusively for training purposes.
#'  
#' @source This data was collected as part of Doctors Without Borders (MSF) outbreak 
#' response and the the Ministry of Health (MoH) in Chad has approved the use 
#' of this data for training purposes. 
#' 
#' The original dataset is AJS_AmTiman.xlsx. 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @references {Spina A, Lenglet A, et al. (2017) A large outbreak of Hepatitis E virus genotype 1 infection in an urban setting in Chad likely linked to household level transmission factors, 2016-2017. PLoS ONE 12(11): e0188240} \doi{10.1371/journal.pone.0188240}
#' 
#' @format A data frame with 1477 rows and 122 columns:
#' \describe{
#'   \item{Number}{a numeric denoting HEV  Count}
#'   \item{HEVID}{a numeric denoting HEV Case ID}
#'   \item{Sex}{a character denoting Sexe [M=Male; F=Femelle]}
#'   \item{Age}{a character denoting Age}
#'   \item{Agegroup}{a character denoting Groupe D'age [1=0 to 4; 2= 5 to 14; 3=15 to 44; 4==45]}
#'   \item{dateentry}{a character denoting Initial Entry into Database (either Questionnaire or Medical Assessment)}
#'   \item{epiquestdate}{a character denoting Date de Questionnaire}
#'   \item{team}{a character denoting Equipe}
#'   \item{chw}{a character denoting AC}
#'   \item{block}{a character denoting Bloc}
#'   \item{hh}{a character denoting Menage}
#'   \item{referredby}{a character denoting Referer par: (1=Hôpital ; 2 = Superviseur Agent Communitaire)}
#'   \item{quartier}{a character denoting Quartier/Village}
#'   \item{interviewee}{a character denoting Statut interroge [Patient ou Parent]}
#'   \item{hhpers}{a character denoting Nombre de personnes dan le menage}
#'   \item{hhmale}{a character denoting Nombre masculin}
#'   \item{hhfemale}{a character denoting Nombre feminin}
#'   \item{hhu5}{a character denoting Nombre d'enfant < 5 ans}
#'   \item{hpreferral}{a character denoting Référé à l’hôpital par Agent Com?  (O = Oui, N = Non)}
#'   \item{hprefpos}{a character denoting Si oui, le patient est-allé?}
#'   \item{patientpresent}{a character denoting Est-ce que le patient est présent ?}
#'   \item{ptjaundice}{a character denoting Est-ce que le patient a la jaunisse?}
#'   \item{ptvomit}{a character denoting Vomissements ?}
#'   \item{mtmental}{a character denoting Etat mental altéré ?}
#'   \item{ptpregnant}{a character denoting Enceinte?}
#'   \item{ptu1}{a character denoting Agée moins d’un an ?}
#'   \item{referring}{a character denoting 15. Allez-vous référer à l’hôpital?}
#'   \item{otherajs}{a character denoting Autre patient dans le foyer?}
#'   \item{otherajsnum}{a character denoting Si oui, combien?}
#'   \item{borehole}{a character denoting Forage?}
#'   \item{comtap}{a character denoting Bonne Fontaine?}
#'   \item{river}{a character denoting Riviere?}
#'   \item{citywater}{a character denoting Eau de la ville?}
#'   \item{otherwater}{a character denoting Autre}
#'   \item{otherwatersp}{a character denoting Si autre…}
#'   \item{watersourcefreq}{a character denoting Quel point utilisez-vous le plus souvent?}
#'   \item{ceramicjar}{a character denoting Jarre}
#'   \item{jerrycan}{a character denoting Jerrycan}
#'   \item{oildrum}{a character denoting Fut}
#'   \item{reserother}{a character denoting Autre?}
#'   \item{reserothersp}{a character denoting Si autre….}
#'   \item{resertype}{a character denoting 20. Type de stockage}
#'   \item{chlorination}{a character denoting 21. Ajouté  chlore la derniere fois?}
#'   \item{volumreser}{a character denoting 22a. Combien de stockage?}
#'   \item{handreser}{a character denoting 22b. Entrer la main dans le stockage?}
#'   \item{hweating}{a character denoting 23. Laver les mains avant de manger?}
#'   \item{hwwater}{a character denoting 24a. Est-ce qu'il y a de l'eau?}
#'   \item{hwsoap}{a character denoting 24b. Est-ce qu'il y a du savon?}
#'   \item{treatwater}{a character denoting Traitez vous l'eau?}
#'   \item{tptreatwater}{a character denoting Type de traitement}
#'   \item{tptreatwaterother}{a character denoting Autre traitment}
#'   \item{nottreatwhy}{a character denoting Si non, pourquoi}
#'   \item{defecriver}{a character denoting Riviere?.1}
#'   \item{defecair}{a character denoting L'air libre?}
#'   \item{defeclatrine}{a character denoting Latrine?}
#'   \item{numlatrine}{a character denoting 26-Combin de personnes qui utilise le latrine?}
#'   \item{dtmedical}{a character denoting Date of Medical Assessment}
#'   \item{hpid}{a character denoting 1. Numero de Clinique/Hopital}
#'   \item{outreachscreened}{a character denoting Outreach screening? [Y/N/U]}
#'   \item{evaljaundice}{a character denoting 7. Deja Evalué pour la Jaunisse?}
#'   \item{jaundiceid}{a character denoting Si Oui, Numero de Cas?}
#'   \item{referredbychw}{a character denoting 8. Référé par l’Agent Communautaire?}
#'   \item{jaundiceid2}{a character denoting Si Oui, Numero de Cas?.1}
#'   \item{medjaundice}{a character denoting 9. Le patient a la jaunisse?}
#'   \item{dtjaundice}{a character denoting 10. Date de début de la jaunisse ?}
#'   \item{medfever}{a character denoting 11a. Fievre?}
#'   \item{mednausea}{a character denoting 11b. Nausées/Anorexie }
#'   \item{medvomit}{a character denoting 11c. Vomissements?}
#'   \item{medepigastric}{a character denoting 11d. Douleur epigastrique?}
#'   \item{meditching}{a character denoting 11e. Démangeaisons ?}
#'   \item{medheadache}{a character denoting 11f. Mal de tete?}
#'   \item{medarthralgia}{a character denoting 11g. Arthralgies?}
#'   \item{meddiar}{a character denoting 11h. Diarrhées}
#'   \item{medbleeding}{a character denoting 11i. Saignements?}
#'   \item{medfev38}{a character denoting 12. Fièvre = 38.0°C?}
#'   \item{medmental}{a character denoting 13. Etat Mental?}
#'   \item{medother}{a character denoting Other symptoms (free text)}
#'   \item{medothhhajs}{a character denoting 14. Autre avec jaunisse dans le menage?}
#'   \item{medothhhajsnum}{a character denoting 14a. Combien?}
#'   \item{othercaseid}{a character denoting 14b. Numero de cas}
#'   \item{medpreg}{a character denoting 15. Enceinte?}
#'   \item{medpregtri}{a character denoting 15a. Trimestre? [1/2/3]}
#'   \item{medpp}{a character denoting 16. Post-Partum?}
#'   \item{medppdays}{a character denoting 16a. Si postpartum, combien de jours?}
#'   \item{medppoutcome}{a character denoting 16b. Resultat de la grossesse?}
#'   \item{matdeathdt}{a character denoting Si décès maternelle, date de décès}
#'   \item{medppga}{a character denoting Gestation weeks of delivery}
#'   \item{medblood}{a character denoting 17. Prelevements de sang?}
#'   \item{medblooddt}{a character denoting Si oui, date de prelevement}
#'   \item{medmalrdt}{a character denoting 18a. Malaria RDT}
#'   \item{medhepb}{a character denoting 18b. Hep B}
#'   \item{medhepc}{a character denoting 18c. Hep C}
#'   \item{medhevrdt}{a character denoting 18d. Hep E RDT}
#'   \item{medhevelisa}{a character denoting Hep E confiramtion ELISA      [MOH  / MSF]}
#'   \item{hevrecent}{a character denoting Confirmed 'recent' case based on ELISA [enter 1 if IgM+]}
#'   \item{hevpcr}{a character denoting Hep E confirmation PCR      [MOH/MSF]}
#'   \item{hevgenotest}{a character denoting Genotype peformed? [Y/N/unk]}
#'   \item{hevgenotype}{a character denoting If yes, what type?}
#'   \item{medhavelisa}{a character denoting Hep A ELISA}
#'   \item{medhbvelisa}{a character denoting Hep Bc ELISA}
#'   \item{medhcvelisa}{a character denoting Hep C ELISA}
#'   \item{arbovpcr}{a character denoting ARBO PCR (YF, Rift, Chik, DEN, WN, ZIK)}
#'   \item{yf}{a character denoting Yellow Fever Elisa}
#'   \item{zika}{a character denoting Zika Elisa}
#'   \item{dengue}{a character denoting Dengue Elisa}
#'   \item{wnv}{a character denoting West Nile Elisa}
#'   \item{rvf}{a character denoting Rift Valley Elisa}
#'   \item{chik}{a character denoting Chikungunya Elisa}
#'   \item{hospitalised}{a character denoting 19. Hospitalised?}
#'   \item{dthospitalisation}{a character denoting Date de hopitalisation?}
#'   \item{outcomehp}{a character denoting 20. Resultat Clinique}
#'   \item{dtdeath}{a character denoting (Si décès la date de décès)}
#'   \item{epiwajs}{a character denoting EpiWeek Jaundice Onset}
#'   \item{epiwhevelisa}{a character denoting EpiWeek Confirmed (IgM+)}
#'   \item{epiwoutreach}{a character denoting EpiWeek FIRST Assessment (Community or Medical)}
#'   \item{epiwmed}{a character denoting EpiWeek MEDICAL  Assessment}
#'   \item{epiwepiquest}{a character denoting EpiWeek Assessment QUESTIONNAIRE}
#'   \item{epiwhp}{a character denoting EpiWeek HOSPITALIZATION}
#'   \item{epiwdeath}{a character denoting EpiWeek DEATH}
#'   \item{caseclass}{a character denoting Suspected/Confirmed/Not A Case (based on HEV RDT)}
#'   \item{Longitude}{a numeric denoting Jittered GPS coordinates}
#'   \item{Latitude}{a numeric denoting Jittered GPS coordinates}
#' }
#' 
#' @docType data
"AJS_AmTiman"





#' @title Population data from an outbreak of Acute Jaundice Syndrome (AJS) in Chad 2016
#'
#' @description
#' Population data from a real outbreak of Hepatitis E virus (HEV) infection which
#' occurred in the town of Am Timan, Chad, between October 2016 and
#' April 2017. 
#'  
#' @details
#' This contains population counts for houses and individuals in each of 
#' the housing blocks found in \link{Blocksshape} and can also be used together 
#' with \link{AJS_AmTiman}. 
#'  
#' @source This data was collected as part of Doctors Without Borders (MSF) outbreak 
#' response and the the Ministry of Health (MoH) in Chad has approved the use 
#' of this data for training purposes. 
#'
#' The original dataset is 'AJS_AmTiman_population.xlsx'. 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @references {Spina A, Lenglet A, et al. (2017) A large outbreak of Hepatitis E virus genotype 1 infection in an urban setting in Chad likely linked to household level transmission factors, 2016-2017. PLoS ONE 12(11): e0188240} \doi{10.1371/journal.pone.0188240}
#' 
#' @format A data frame with 648 rows and 3 columns:
#' \describe{
#'   \item{variable1}{explanation of a variable}
#'   \item{variable2}{more explanation of variables}
#' }
#' 
#' @docType data
"AJS_AmTiman_population"


#' @title Shapefile of housing blocks from an outbreak of Acute Jaundice Syndrome (AJS) in Chad 2016
#'
#' @description
#' Shapefile data from a real outbreak of Hepatitis E virus (HEV) infection which
#' occurred in the town of Am Timan, Chad, between October 2016 and
#' April 2017. 
#'  
#' @details
#' This contains a shapefile for housing blocks which correspond with the population
#' counts found in \link{AJS_AmTiman_population} and can also be used together 
#' with \link{AJS_AmTiman}. 
#'  
#' @source This data was collected as part of Doctors Without Borders (MSF) outbreak 
#' response and the the Ministry of Health (MoH) in Chad has approved the use 
#' of this data for training purposes. 
#' 
#' The original dataset is 'Blocksshape.zip' (which contains the necessary 
#' Shapefile components). 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @references {Spina A, Lenglet A, et al. (2017) A large outbreak of Hepatitis E virus genotype 1 infection in an urban setting in Chad likely linked to household level transmission factors, 2016-2017. PLoS ONE 12(11): e0188240} \doi{10.1371/journal.pone.0188240}
#' 
#' @format A data frame with 650 rows and 3 columns:
#' \describe{
#'   \item{variable1}{explanation of a variable}
#'   \item{variable2}{more explanation of variables}
#' }
#' 
#' @docType data
"Blocksshape"



#' @title Shapefile of neighbourhoods (*fr*: quartiers) from an outbreak of Acute Jaundice Syndrome (AJS) in Chad 2016
#'
#' @description
#' Shapefile data from a real outbreak of Hepatitis E virus (HEV) infection which
#' occurred in the town of Am Timan, Chad, between October 2016 and
#' April 2017. 
#'  
#' @details
#' This contains a shapefile for neighbourhoods which correspond with the population
#' counts found in \link{AJS_AmTiman_population} and can also be used together 
#' with \link{AJS_AmTiman}. 
#'  
#' @source This data was collected as part of Doctors Without Borders (MSF) outbreak 
#' response and the the Ministry of Health (MoH) in Chad has approved the use 
#' of this data for training purposes. 
#'
#' The original dataset is 'Blocksshape.zip' (which contains the necessary 
#' Shapefile components). 
#'  
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @references {Spina A, Lenglet A, et al. (2017) A large outbreak of Hepatitis E virus genotype 1 infection in an urban setting in Chad likely linked to household level transmission factors, 2016-2017. PLoS ONE 12(11): e0188240} \doi{10.1371/journal.pone.0188240}
#' 
#' @format A data frame with 34 rows and 3 columns:
#' \describe{
#'   \item{variable1}{explanation of a variable}
#'   \item{variable2}{more explanation of variables}
#' }
#' 
#' @docType data
"Quartiersshape"