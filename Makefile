OCR_OUTPUTS := $(patsubst pdf/%.pdf, text/%.txt, $(wildcard pdf/*.pdf))
CLEAN_CODES := $(patsubst text/%.txt, legal-codes/%.txt, $(wildcard text/*.txt))
SPLIT_CODES := $(patsubst legal-codes/%.txt, legal-codes-split/%-SPLIT.txt, $(wildcard legal-codes/*.txt))
INCLUDES  := $(wildcard www-lib/*.html)
NOTEBOOKS   := $(patsubst %.Rmd, %.html, $(wildcard *.Rmd))

all : $(NOTEBOOKS) cache/corpus-lsh.rda cache/network-graphs.rda article/article.pdf

codes : $(CLEAN_CODES)

splits : $(SPLIT_CODES)

lsh : cache/corpus-lsh.rda

cache/corpus-lsh.rda : $(SPLIT_CODES)
	Rscript --vanilla scripts/corpus-lsh.R

cache/network-graphs.rda : cache/corpus-lsh.rda
	Rscript --vanilla scripts/network-graphs.R

article/article.pdf : article/article.Rmd cache/corpus-lsh.rda cache/network-graphs.rda
	R --slave -e "set.seed(100); rmarkdown::render('article/$(<F)')"


%.html : %.Rmd cache/corpus-lsh.rda cache/network-graphs.rda $(INCLUDES)
	R --slave -e "set.seed(100); rmarkdown::render('$(<F)')"

index.html : index.Rmd $(INCLUDES) $(filter-out index.html, $(NOTEBOOKS))

legal-codes-split/%-SPLIT.txt : legal-codes/%.txt $(CLEAN_CODES)
	Rscript --vanilla scripts/split-code.R $<
	touch $@

legal-codes/%.txt : text/%.txt
	Rscript --vanilla scripts/clean-text.R $^ $@

text/%.txt : temp/%.txt
	cp $^ $@

temp/%.txt : pdf/%.pdf
	mkdir -p temp
	@echo "\nBursting $^ into separate files"
	pdftk $^ burst output temp/$*.page-%04d.pdf
	@echo "\nConverting the PDFs for $^ to the image files"
	for pdf in temp/$*.page-*.pdf ; do \
		convert -density 600 -depth 8 $$pdf $$pdf.png ; \
	done
	@echo "\nDoing OCR for each page in $^"
	for png in temp/$*.page-*.pdf.png ; do \
		tesseract $$png $$png tesseract-config ; \
	done
	@echo "\nConcatenating the text files into $@"
	cat temp/$*.page-*.pdf.png.txt > temp/$*.txt

.PHONY : clean
clean :
	rm -rf $(NOTEBOOKS)
	rm -rf temp/*

.PHONY : clean-splits
clean-splits :
	rm -rf text/*
	rm -f legal-codes/*
	rm -rf legal-codes-split
	rm -f cache/corpus-lsh.rda
	mkdir legal-codes-split

.PHONY : clobber
clobber : clean clean-splits
