# appliedepidata

This package stores all Applied Epi data across books, case studies, courses and tutorials

## stuff to consider

### storage 
- folder structure 
  - **data** R datasets go in data folder
  - **inst/extdata**Non-R datasets go in inst>extdata
    - option for adding messy datasets a la [{medicaldata}](https://github.com/higgi13425/medicaldata/?tab=readme-ov-file#messy-datasets)
  - **internal data** additional complication is that when you build a package, you can make the Rda datasets (from data folder) "internal" (more efficient for file storage, as then become part of binary), and these are then access by doing package::dataset. They can also be imported directly from github using link to the file in data folder e.g. 'rio(<github-raw url>)'. Read this [r packages chapter](https://r-pkgs.org/data.html) for details. 
  - **data-raw** usually contains R scripts which are used for creating the exported or internal data (e.g. if have edited dataset, or where {usethis} internalises dataset)
  - **sysdata** probably the *tableoftables* should just stay in *extdata* but alternatively could go in sysdata which is not exported (i.e. just for package usage)  
- naming of datasets (human readable/localised user-facing with an internal lookup table of standardised dataset IDs)
  - ?WHO or HDx functions or standardised file naming 
    - no clear guidelines, [datacarpentry](https://datacarpentry.org/rr-organization1/01-file-naming/index.html) has basics and [OCHA](https://humanitarian.atlassian.net/wiki/spaces/imtoolbox/pages/42502092/File+Naming+Convention) very basic. Tidytuesday doesnt even enforce naming. 
  - versioning of datasets (and edits thereof, e.g. same data for diff bits of course)
    - define overarching source file and resulting child files
    - do these all go within the same folder? Or just defined by similar prefix/ID
  - ?language suffixes

### functions 
- [x] list available datasets  
~~ - search available datasets (wrapper around list/*tableoftables* to make searchable by country, disease, language, name, ID, etc)~~
- [ ] get data (different to saving if just want to use within Rstudio, ?necessary - rather than have new users freakout about different ways of accessing the data)
- [ ] download/save dataset locally function (based on *tableoftables*)
- [ ] data dictionary for a dataset: start with wrapper for  [{datadict}](https://github.com/epicentre-msf/datadict) as demo, then either consider pulling parts to {epidict} or offer them help to get on CRAN. 
  - if decide to help w/ {datadict} then {epidict} would just become a fake data generator. 
- [ ] function which uses a data dict to create the description section in roxygen for a dataset
- [ ] in phase 2 could build helper functions that create the description file from *tableoftables* (then the user just needs to edit an excel file) 
- [ ] unit testing for functions
  - could pull some from [{gapminder}](https://github.com/jennybc/gapminder/)

### Documentation 
- description file for each dataset in pkg
  - ideally: data dictionary used to fill in the *man* files for each
  - probably do the same way [alison horst](https://github.com/lter/lterdatasampler/) does
- readme/pkgdown table (adapted from *tableoftables*) listing available datasets, versions, languages, source, and where used (e.g. case study, course, tutorial, epirhandbook)  
  ~~ - ideally can be fed by list datasets function ~~
- pkgdown separated by heading for dictionaries and actual datasets, and cross-links between the two
- guideline for contributing datasets similar to [tidytuesday](https://github.com/rfordatascience/tidytuesday/blob/master/.github/pr_instructions.md)
- licensing: while the overall package repo will be GPL3, it is possible that individual datasets will come under a different license (so there needs to be a license section in documentation for each dataset)


- process for adding a new dataset: 
  - if a non-R (not .rda) file
    - place file in 'inst/extdata' folder
      - if adding a shapefile then zip it 
    - in console run 'usethis::use_data_raw(<name of your file w/out extension>)
    - read in the file with 'rio' and 'system.file'
    - make edits as needed
    - save with usethis::usedata()
  - if adding an .rda file: 