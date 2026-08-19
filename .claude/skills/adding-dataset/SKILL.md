---
name: adding-dataset
description: Add one or more new datasets to the appliedepidata R package (raw files already dropped in inst/extdata/), following the project's documented process — validate the files, ask the user for missing metadata, then wire up data-raw/, R/ docs, tableoftables.xlsx, _pkgdown.yml, and devtools::document().
---

# Adding a dataset to `appliedepidata`

This is a self-contained playbook for adding new dataset(s) to the `appliedepidata` R
package. It assumes the user has already placed one or more raw files into
`inst/extdata/` and wants them fully wired into the package. It works for a single
file or a batch of many.

The authoritative process is documented at
https://appliedepi.github.io/appliedepidata/articles/adding-data.html#folders-you-will-edit
— this skill operationalizes that process, plus a set of real failure modes
discovered while using it, into concrete steps and questions.

## Mental model: what "adding a dataset" actually touches

Four places have to stay in sync for every dataset:

| Location | What goes there |
|---|---|
| `inst/extdata/` | The raw source file(s), shipped as-is (`.xlsx`, `.csv`, `.rds`, `.json`, zipped shapefiles, …) |
| `data-raw/<name>.R` | A short script that reads the raw file via `system.file()` + `rio::import()` (or `sf::read_sf()` for spatial data) and calls `usethis::use_data()` to produce `data/<name>.rda` |
| `R/<group>_doc.R` | Roxygen2 `@docType data` blocks — one per dataset, grouped by real-world topic into a shared file |
| `inst/extdata/tableoftables.xlsx` | The metadata registry every search/lookup function (`get_data()`, `save_data()`, `lookup_dataset()`) reads from |
| `_pkgdown.yml` | A `subtitle`/`contents` entry per dataset group, so the group shows up on the reference site — **this step is easy to forget** |

`data/`, `man/`, and `tests/` are **generated output** — never hand-edit them; they come from running the scripts above plus `devtools::document()`.

## Step 0 — Validate the raw files before touching anything else

For every file the user says they've added, before writing any code:

1. **Confirm it exists and isn't empty.** An empty (0-byte) file can't be imported —
   skip it and tell the user, rather than guessing at content or fabricating a
   placeholder.
2. **Check the filename for naming-rule violations** (see Naming rules below):
   spaces, punctuation, double extensions (e.g. `name.geo.json`), generic names
   (`linelist_cleaned.xlsx` is the literal example the vignette warns against),
   inconsistent prefixes within a batch (e.g. one file missing an underscore that
   its siblings have).
3. **Check for duplicate content against existing datasets.** A new file with a
   suspicious name (matches or resembles an existing dataset name) or a suspicious
   size (matches an existing extdata file's byte size) should be diffed:
   ```r
   old <- rio::import("inst/extdata/<existing_file>")
   new <- rio::import("inst/extdata/<new_file>")
   identical(old, new)          # exact duplicate check
   all.equal(as.data.frame(old), as.data.frame(new), check.attributes = FALSE)  # value-only check
   ```
   Also check whether a "new" file is actually a **sub-component of an existing
   complex object** (e.g. one element of a list returned by a model, like
   `epinow_res$estimates$samples`) rather than genuinely new data.
4. **Never silently assume duplicate ⇒ skip, or duplicate ⇒ add.** Surface what you
   found and ask (see Questions to ask, below) — the right call depends on why the
   user is adding it (e.g. a rebranded teaching bundle vs. an accidental re-drop).

## Step 1 — Ask the user for the metadata you can't infer

Don't guess at facts you can't verify from the file itself, especially source,
license, and real-vs-fictional status — these are legal/attribution-relevant and
wrong guesses are worse than a question. Batch questions when several files share
an answer; ask per-file only when files in the same batch clearly differ.

### Batch-level questions (ask once, applies to the whole drop)

- **What real-world (or fictional) subject/disease/topic does this batch represent?**
  Drives `subject`, `context`, and the `group_identifier`.
- **Country** (ISO 3166-1 alpha-3, e.g. `sle`, `chn`) — or is this multi-country /
  global data? (No fixed convention exists yet for global-scope rows; introduce a
  clear value like `global` and say so.)
- **Language** (ISO 639-1, e.g. `en`), **scale** (`subnational`/`national`/`international`/`global`),
  **year** (the earliest year the data covers).
- **Fictional or real data?** If real, what's the actual source and license? If
  fictional/teaching-only, say so explicitly rather than inventing a source.
- **Usage tag** — what course, case study, or book chapter is this for? (Existing
  convention: free-text like `epirhandbook`, a course code, or a case-study id.)
- **Should these files be one group, several groups, or folded into an existing
  group?** If the batch mixes clearly unrelated content (e.g. one file is a
  global reference dataset and the rest are country-specific), don't force
  everything into one group_identifier just because they arrived together.

### Per-file questions (ask when a file is individually ambiguous)

- **What should the clean object/file name be?** (No spaces, not generic, unique
  vs. `tableoftables.xlsx`, consistent prefix with siblings.)
- **If this file duplicates or overlaps existing content:** add it anyway as an
  intentional rebrand/bundle, rename it to something non-duplicate, or skip it?
- **If a file is a genuinely new derivative of existing data** (a subset, a
  different date range, a different processing stage): is it a *new, unrelated*
  dataset (→ increment `type_version`) or the *same logical thing in a different
  format/degree of processing* (→ increment `data_version`)? See the table below —
  don't default to one without thinking about which it is.
- **License/source for anything genuinely new and real-world**, if not already
  covered by the batch-level question.

## Step 2 — Per dataset: `data-raw/<name>.R`

```r
## code to prepare `<name>` dataset goes here

file_path <- system.file("extdata", "<raw_filename>", package = "appliedepidata")

<name> <- rio::import(file_path)          # or sf::read_sf(file_path) for spatial data

# process data as needed (e.g. cleaning, recoding, restructuring)

usethis::use_data(<name>, overwrite = TRUE)
```

Naming: the R object name is usually the raw filename minus extension. If two raw
files share a base name except for extension (e.g. `x.xlsx` and `x.rds`), give the
R objects distinct names (`x_excel`, `x_rds`) — otherwise their `.rda` files
collide.

**Gotcha:** `system.file()` only resolves to files in `inst/extdata/` if the
package is loaded from source. If `appliedepidata` is already installed from an
older build, `system.file(package = "appliedepidata")` silently resolves to the
*installed* copy, which won't have your new file yet, and you'll get a confusing
"No such file" error. Fix: run `devtools::load_all(quiet = TRUE)` first, in the
same R session, before sourcing any `data-raw/` script.

## Step 3 — Per group: `R/<group_name>_doc.R`

One Roxygen block per dataset, ending in the bare object name as a quoted string.
Follow the style already used throughout the package:

```r
#' @title <short descriptive title>
#'
#' @description
#' <one or two sentences>
#'
#' @details
#' <what it is, what it's derived from, links to related datasets via \link{}>
#'
#' @source <where it came from, or "Fictional data created by Applied Epi for
#'   training purposes">
#'
#' This is version <n>.0.
#'
#' This dataset is <Language>.
#'
#' This dataset is licensed under [<license>](<url>)
#'
#' @format <a data frame with N rows and M columns / an sf object / a large list>
#'
#' @docType data
"<name>"
```

If several datasets in a group are true duplicates of the same underlying object
(e.g. small variants read differently), you can share one help page with
`@rdname <primary_name>` + `@format NULL` on the secondary blocks, mirroring how
`epinow_res`/`epinow_res_small`/`generation_time`/`incubation_period` are grouped
in this package.

## Step 4 — Register in `inst/extdata/tableoftables.xlsx`

This is a binary file — edit it programmatically, never by hand-guessing bytes:

```r
tt <- rio::import("inst/extdata/tableoftables.xlsx")

new_rows <- data.frame(
  name = ..., type = ..., extension = ...,
  type_version = ..., data_version = ...,
  language = ..., country = ..., scale = ..., subject = ..., context = ...,
  fictional = ..., year = ...,
  description = ..., usage = ..., license = ...,
  group_identifier = ..., unique_identifier = ...,
  stringsAsFactors = FALSE
)

stopifnot(identical(colnames(new_rows), colnames(tt)))
stopifnot(!any(new_rows$name %in% tt$name))
stopifnot(!any(new_rows$unique_identifier %in% tt$unique_identifier))

tt2 <- rbind(tt, new_rows)
rio::export(tt2, "inst/extdata/tableoftables.xlsx")
```

### Column reference

| Column | Meaning |
|---|---|
| `name` | Filename without extension; must be unique across the whole registry |
| `type` | `linelist`, `population`, `shape`, `survey`, `dictionary`, `aggregate`, `other`, … |
| `extension` | File type (`xlsx`, `csv`, `rds`, `json`, `zip`, …) — free text, not validated by code |
| `type_version` | Increment for a **new, unrelated** dataset within the same group |
| `data_version` | Increment when the **same underlying thing** changes format or gets a variable/processing change |
| `language` | ISO 639-1 (`en`, `fr`, …) |
| `country` | ISO 3166-1 alpha-3 (`sle`, `chn`, …); no fixed convention yet for global data |
| `scale` | `subnational` / `national` / `international` / `global` |
| `subject` | Main topic (disease name, or a bundle theme like `gis_basics`) |
| `context` | `outbreak`, `survey`, `mapping`, `surveillance`, `other`, … |
| `fictional` | `yes` / `no` |
| `year` | Earliest year the data covers |
| `description` | One sentence |
| `usage` | Course code, case-study id, or a free-text tag like `epirhandbook` |
| `license` | `MIT`, `gpl3`, `CC by-NC-SA 4.0`, `CC by-IGO`, `Public Domain`, … |
| `group_identifier` | Usually `{subject}_{context}_{country}_{year}` — ties related datasets together for `save_data(group_identifier = ...)` |
| `unique_identifier` | `{group_identifier}_{type}_{type_version}_{data_version}` — must be globally unique |

**On `type_version` vs `data_version`:** the live registry is not fully
self-consistent (some groups increment `type_version` for what's arguably a
format change, others increment `data_version` for what's arguably a new
dataset). When genuinely unsure, follow the written definition above rather than
copying whichever precedent is closest — and say so if you deliberately choose
precedent over the literal definition.

## Step 5 — Update `_pkgdown.yml`

Add one `subtitle`/`contents` block per new group (or append to an existing one if
the dataset joins an existing group):

```yaml
- subtitle: <Human-readable topic>, <Place> (<year>) - <Language>
  contents:
  - dataset_one
  - dataset_two
```

Validate with `yaml::read_yaml("_pkgdown.yml")` after editing — a malformed block
fails silently on the docs site otherwise.

## Step 6 — Generate `.rda` files and run `devtools::document()`

```r
devtools::load_all(quiet = TRUE)
source("data-raw/<name1>.R")
source("data-raw/<name2>.R")
# ... one source() per new data-raw script ...
devtools::document()
```

This regenerates `man/*.Rd` and `NAMESPACE`. Data documentation normally doesn't
add new exports, so an unchanged `NAMESPACE` after this step is expected, not a
bug.

## Step 7 — Verify, don't just assume it worked

- Re-run `list_data()` — a single malformed filename (double extension, unusual
  characters) can throw an error that breaks this function for **every** dataset
  in the package, not just the new one. Catch this before it ships.
- Spot-check `save_data(name = "<new_name>", path = tempdir())` for at least one
  new dataset — this is the function most sensitive to filename/registry
  mismatches (it looks up the extdata file as `{name}.{extension}` from the
  registry, so a raw filename that doesn't match the registered `name` will fail
  silently until this is tested).
- Spot-check `get_data(name = "<new_name>")` for at least one new dataset,
  especially if it's spatial (`sf`) or a complex list — these have dedicated
  post-processing paths in `get_data()` worth exercising.
- For a larger batch, consider a full `devtools::install()` (or `R CMD build` +
  `R CMD INSTALL`) and testing against the *installed* package in a fresh R
  session, not just `load_all()`.

## Step 8 — Optional: `NEWS.md` / `DESCRIPTION` version bump

Not part of the official documented process, but commonly wanted for a PR. Ask
the user whether they want this, and whether new work should get its own version
bump or fold into an existing unreleased one:

```md
# appliedepidata 0.0.0.9XXX

* Added <dataset(s)>: `name_1`, `name_2`, ...
```

```
Version: 0.0.0.9XXX   # in DESCRIPTION
```

## Naming rules (enforce these proactively, don't wait to be asked)

- No spaces, no generic names (`linelist_cleaned.xlsx` is the vignette's own bad
  example), no double file extensions (`name.geo.json` — this actually **breaks
  `list_data()`** via `tidyr::separate_wider_delim()`, which expects exactly one
  `.` in the filename).
- Verify the proposed name isn't already in `tableoftables.xlsx`.
- Group related files with an identical, consistently-applied prefix
  (`examplename_data`, `examplename_population`, not `examplenamedata` missing a
  separator).
- If a raw filename must be changed to satisfy the above, update it consistently
  in: the file itself, the `system.file()` call in its `data-raw/` script, and any
  `@source` text in its Roxygen doc block that names the file literally.

## Common pitfalls (found in practice, not hypothetical)

- A file with spaces in its name breaks `save_data()`'s exact-match lookup even
  though the R object name is clean — the raw file must be renamed too, not just
  the object.
- A double-dot filename breaks `list_data()` for the whole package, not just the
  offending row.
- `_pkgdown.yml` is easy to forget entirely — it's not generated automatically by
  `devtools::document()`.
- "New" files are sometimes exact duplicates, or unbundled sub-components, of
  data that's already registered. Always diff before assuming novelty.
- Empty (0-byte) source files can slip into a batch — check sizes before writing
  any code around them.
