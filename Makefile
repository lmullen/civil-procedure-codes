OCR_OUTPUTS := $(patsubst pdf/%.pdf, text/%.txt, $(wildcard pdf/*.pdf))
CLEAN_CODES := $(patsubst text/%.txt, legal-codes/%.txt, $(wildcard text/*.txt))
SPLIT_CODES := $(patsubst legal-codes/%.txt, legal-codes-split/%-SPLIT.txt, $(wildcard legal-codes/*.txt))
NOTEBOOKS := $(patsubst %.Rmd, %.html, $(wildcard *.Rmd))

all : $(NOTEBOOKS)

codes : $(CLEAN_CODES)

splits : $(SPLIT_CODES)

%.html : %.Rmd $(CLEAN_CODES)
	R --slave -e "set.seed(100); rmarkdown::render('$(<F)')"

legal-codes-split/%-SPLIT.txt : legal-codes/%.txt
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
	rm -rf temp/

.PHONY : clobber
clobber :
	rm -rf text/*
	rm -rf legal-codes/*

