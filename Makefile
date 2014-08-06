OCR_OUTPUTS := $(patsubst pdf/%.pdf, text/%.txt, $(wildcard pdf/*.pdf))

all : $(OCR_OUTPUTS)
	@echo "OCRing all the PDFs in ./pdf"

text/%.txt : pdf/%.pdf
	mkdir -p temp
	@echo "\nConverting the PDF $^ to the image files"
	convert -density 600 -depth 8 $^ temp/$*.page-%04d.png
	@echo "\nDoing OCR for each page"
	$(eval $@_PAGES := $(wildcard temp/$*.page-*.png))
	for page in $($@_PAGES) ; do \
		tesseract $$page $$page tesseract-config ; \
	done
	@echo "\nConcatenating the text files into $@"
	cat $(wildcard temp/$*.page-*.png.txt) > $@

.PHONY : clean
clean : 
	rm -rf temp/*

.PHONY : clobber
clobber : 
	rm -rf text/*

