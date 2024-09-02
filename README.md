# appliedepidata

This package stores all Applied Epi data across books, courses and tutorials

## stuff to consider

### storage 
- folder structure 
  - R datasets go in data folder
  - Non-R datasets go in inst>extdata
    - option for adding messy datasets a la [{medicaldata}](https://github.com/higgi13425/medicaldata/?tab=readme-ov-file#messy-datasets)
- naming of datasets (human readable/localised user-facing with an internal lookup table of standardised dataset IDs)
  - ?WHO or HDx functions or standardised file naming 
    - no clear guidelines, [datacarpentry](https://datacarpentry.org/rr-organization1/01-file-naming/index.html) has basics and [OCHA](https://humanitarian.atlassian.net/wiki/spaces/imtoolbox/pages/42502092/File+Naming+Convention) very basic. Tidytuesday doesnt even enforce naming. 
  - versioning of datasets (and edits thereof, e.g. same data for diff bits of course)
    - define overarching source file and resulting child files
    - do these all go within the same folder? Or just defined by similar prefix/ID
  - ?language suffixes

### functions 
- list available datasets (searchable by country, disease, language, name, ID, etc)
- get data (different to saving if just want to use within Rstudio)
- downloading/save dataset function 
- function to create a data dictionary for a dataset (?wrapper for [{datadict}](https://github.com/epicentre-msf/datadict))
- function which uses a data dict to create the description section in roxygen for a dataset
- unit testing for functions
  - could pull some from [{gapminder}](https://github.com/jennybc/gapminder/)

### Documentation 
- description file for each dataset in pkg
  - data dictionary used to fill in the *man* files for each
- readme/pkgdown table listing available datasets, versions, languages, source, and where used (e.g. case study, course, tutorial, epirhandbook)
  - ideally can be fed by list datasets function
- pkgdown separated by heading for dictionaries and actual datasets, and cross-links between the two
- guideline for contributing datasets similar to [tidytuesday](https://github.com/rfordatascience/tidytuesday/blob/master/.github/pr_instructions.md)
- licensing: while the overall package repo will be GPL3, it is possible that individual datasets will come under a different license (so there needs to be a license section in documentation for each dataset)
