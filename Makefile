OCR_OUTPUTS := $(patsubst pdf/%.pdf, text/%.txt, $(wildcard pdf/*.pdf))
CLEAN_CODES := $(patsubst text/%.txt, legal-codes/%.txt, $(wildcard text/*.txt))
SPLIT_CODES := $(patsubst legal-codes/%.txt, legal-codes-split/%-SPLIT.txt, $(wildcard legal-codes/*.txt))
INCLUDES  := $(wildcard www-lib/*.html)

all : cache/corpus-lsh.rda cache/network-graphs.rda article/Funk-Mullen.Spine-of-Legal-Practice.pdf index.html 

# Clean up the codes in `text/`
legal-codes/%.txt : text/%.txt
	Rscript --vanilla scripts/clean-text.R $^ $@

# Split the codes into sections
legal-codes-split/%-SPLIT.txt : legal-codes/%.txt
	@mkdir -p legal-codes-split
	Rscript --vanilla scripts/split-code.R $<
	@touch $@

# Find the similarities in the split codes
cache/corpus-lsh.rda : $(SPLIT_CODES)
	Rscript --vanilla scripts/corpus-lsh.R

# Create the network graph data from the split codes
cache/network-graphs.rda : cache/corpus-lsh.rda
	Rscript --vanilla scripts/network-graphs.R

# Create the article
article/Funk-Mullen.Spine-of-Legal-Practice.pdf : article/Funk-Mullen.Spine-of-Legal-Practice.Rmd cache/corpus-lsh.rda cache/network-graphs.rda
	R --slave -e "set.seed(100); rmarkdown::render('$<', output_format = 'all')"

# Create a listing of the files in the notebook home page
index.html : index.Rmd $(INCLUDES)

.PHONY : clean
clean :
	rm -rf $(NOTEBOOKS)
	rm -rf temp/*
	rm -f article.pdf

.PHONY : clean-splits
clean-splits :
	rm -f legal-codes/*
	rm -rf legal-codes-split
	rm -f cache/corpus-lsh.rda

.PHONY : clobber
clobber : clean clean-splits

.PHONY : codes
codes : $(CLEAN_CODES)

.PHONY : splits
splits : $(SPLIT_CODES)

.PHONY : lsh
lsh : cache/corpus-lsh.rda

.PHONY : article
article : article/Funk-Mullen.Spine-of-Legal-Practice.pdf

