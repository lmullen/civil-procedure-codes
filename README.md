## The Spine of American Law

This repository contains the analytical code for [Kellen Funk](http://kellenfunk.org) and [Lincoln A. Mullen](http://lincolnmullen.com), "The Spine of American Law: Digital Text Analysis and U.S. Legal Practice," _American Historical Review_ 123, no. 1 (2018): 132-164, <https://doi.org/10.1093/ahr/123.1.132>. The article studies borrowing in legal codes of civil procedure in the nineteenth-century United States. Please note that this repository produces the final analysis and visualizations for the project, but the text of the article is that of the "author's accepted manuscript," or pre-print. You can find pre-prints of the article at [SSRN](https://ssrn.com/abstract=3001377) and [SocArXiv](https://osf.io/preprints/socarxiv/w8un4/).

### Description of repository

- The `Makefile` shows the relationships between the pieces of this project, and runs them in the proper order.
- The `scripts/` directory contains R scripts which do the analytical work, saving the results.
- The `article/` directory contains the R Markdown document which reproduces the visualizations for the article.
- The `R` directory contains functions which are used throughout the repository.
- The `notebooks` directory contains preliminary stages of our research. These R Markdown files are not intended to be reproducible.
- The `procedure-codes` directory contains files with the OCR text for each procedure code or statute in our corpus. Running the scripts will do some minor cleaning to the OCR and split the codes into sections.
- Running the code will produce an `out` directory which contains figures, clusters, and matches.
- The `packrat` directory documents the R package dependencies.

### How to reproduce this research

This analysis was run using R version 3.4.3 as well as some standard GNU utilities as identified in the `Makefile`. R package dependencies are documented in the [`packrat/packrat.lock`](https://github.com/lmullen/civil-procedure-codes/blob/master/packrat/packrat.lock) file. On running R for the first time, packrat should attempt to install the needed dependencies, but running `make` will also run an explicit step to install those dependencies.

To reproduce our analysis, run the folllwing steps using GNU Make.

1. Run `make setup && make codes && make splits` to create directories for the results, install the R packages from packrat, clean the codes text files, and split them into sections.
2. Running `make all` will then run all the analytical code in the repository in the proper order. Various subtasks, documented in the `Makefile` will create pieces of the analysis, such as finding the matches between sections (`make lsh`), creating the network graph (`make network`), creating the clusters (`make clusters`), and creating the article and visualizations (`make article`).

### License

The code in this repository is made available under the MIT license. See file `LICENSE.txt` for details.

