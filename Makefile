OCR_OUTPUTS := $(patsubst pdf/%.pdf, text/%.txt, $(wildcard pdf/*.pdf))

all : $(OCR_OUTPUTS)
	@echo "\nDone doing OCR for all the PDFs in ./pdf"

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

text/%.txt : temp/%.txt
	cp $^ $@

.PHONY : clean
clean : 
	rm -rf temp/

.PHONY : clobber
clobber : 
	rm -rf text/*

.PHONY : up
up :
	rsync -avL --progress -e "ssh -i /Users/lmullen/dev/ami/AmazonOCRMachine.pem" pdf text Makefile tesseract-config ubuntu@ec2-54-210-183-92.compute-1.amazonaws.com:~/legal-codes/

.PHONY : down
down :
	rsync -avL --progress --exclude /temp --exclude Makefile -e "ssh -i /Users/lmullen/dev/ami/AmazonOCRMachine.pem" ubuntu@ec2-54-210-183-92.compute-1.amazonaws.com:~/legal-codes/ ./
