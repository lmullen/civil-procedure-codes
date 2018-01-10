OCR_OUTPUTS := $(patsubst pdf/%.pdf, procedure-codes/%.txt, $(wildcard pdf/*.pdf))
CLEAN_CODES := $(patsubst procedure-codes/%.txt, cleaned-codes/%.txt, $(wildcard procedure-codes/*.txt))
SPLIT_CODES := $(patsubst cleaned-codes/%.txt, procedure-code-sections/%-SPLIT.txt, $(wildcard cleaned-codes/*.txt))

all : cache/corpus-lsh.rda cache/network-graphs.rda article/Funk-Mullen.Spine-of-American-Law.pdf clusters

# Setup tasks
.PHONY : setup packrat dirs

setup : | packrat dirs

packrat :
	Rscript -e "packrat::restore()"

dirs :
	mkdir -p cleaned-codes proc
	mkdir -p procedure-code-sections
	mkdir -p out
	mkdir -p out/clusters
	mkdir -p out/figures
	mkdir -p out/matches
	mkdir -p cache

# Clean up the codes in `procedure-codes/`
.PHONY : codes
codes : $(CLEAN_CODES)

cleaned-codes/%.txt : procedure-codes/%.txt
	Rscript --vanilla scripts/clean-text.R $^ $@

# Split the codes into sections
.PHONY : splits
splits : $(SPLIT_CODES)

procedure-code-sections/%-SPLIT.txt : cleaned-codes/%.txt
	Rscript --vanilla scripts/split-code.R $<
	@touch $@

# Find the similarities in the split codes
.PHONY : lsh
lsh : cache/corpus-lsh.rda

cache/corpus-lsh.rda : $(SPLIT_CODES)
	Rscript --vanilla scripts/corpus-lsh.R

# Create the network graph data from the split codes
.PHONY : network
network : cache/network-graphs.rda

cache/network-graphs.rda : cache/corpus-lsh.rda
	Rscript --vanilla scripts/network-graphs.R

# Create the clusters
.PHONY : clusters
clusters : out/clusters/DONE.txt

out/clusters/DONE.txt : cache/corpus-lsh.rda
	Rscript --vanilla scripts/cluster-sections.R && \
	touch $@

# Create the article
.PHONY : article
article : article/Funk-Mullen.Spine-of-American-Law.pdf

article/Funk-Mullen.Spine-of-American-Law.pdf : article/Funk-Mullen.Spine-of-American-Law.Rmd cache/corpus-lsh.rda cache/network-graphs.rda
	R --slave -e "set.seed(100); rmarkdown::render('$<', output_format = 'all')"

# Update certain files in the research compendium for AHR
.PHONY : compendium
compendium :
	zip -j compendium/all-section-matches.csv.zip out/matches/all_matches.csv
	zip -j compendium/best-section-matches.csv.zip out/matches/best_matches.csv
	zip -r compendium/procedure-codes.zip procedure-codes/
	zip -r compendium/procedure-code-sections.zip procedure-code-sections/
	zip -r compendium/clusters-of-sections.zip out/clusters/
	git archive --format=zip --output=compendium/field-code-analysis.zip master

.PHONY : clean
clean :
	rm -rf temp/*

.PHONY : clean-splits
clean-splits :
	rm -f cleaned-codes/*
	rm -rf procedure-code-sections

.PHONY : clean-clusters
clean-clusters :
	rm -rf out/clusters
	rm -f cache/clusters.rds

.PHONY :  clean-compendium
clean-compendium : 
	rm -f compendium/all-section-matches.csv.zip
	rm -f compendium/best-section-matches.csv.zip
	rm -f compendium/procedure-codes.zip
	rm -f compendium/procedure-code-sections.zip
	rm -f compendium/clusters-of-sections.zip
	rm -f compendium/field-code-analysis.zip

.PHONY : clobber
clobber : clean
	rm -f cache/*
	rm -rf out/*

