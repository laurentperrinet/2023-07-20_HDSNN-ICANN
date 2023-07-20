################################################
SRC = Perrinet23icann
SLUG = perrinet-23-icann
# # SRC_rev = Pasturel_etal2019
# DIR_rev = ../2022-07-30_Jérémie-etal-Vision_62cd1d255f6332a5b90c294e
# SRC_rev = $(DIR_rev)/Jeremie-etal-Vision
#LATEXMK = latexmk -pdf -pdflatex=lualatex
LATEXMK = latexmk -pdf
BIBTEX = bibtex
################################################
all: pdf
default: pdf
pdf: $(SRC).pdf
# diff: $(SRC)_trackedchanges.pdf
################################################
LATEXMK = latexmk -bibtex -pdf
#  -pdflatex=pdflatex
################################################

# post-production
# $(SRC)_trackedchanges.tex: $(SRC).tex $(SRC).bib $(SRC_rev).tex
# 	latexdiff --flatten --graphics-markup=both $(SRC_rev).tex $(SRC).tex > $(SRC)_trackedchanges.tex

# response_to_reviewers.pdf: response_to_reviewers.tex $(SRC).tex $(SRC).bib
# 	$(LATEXMK) response_to_reviewers.tex

zip:
	zip $(SRC).zip 2023-07-20_ICANN2023_License2publish_signed.pdf llncs.cls Perrinet23icann.pdf Perrinet23icann.tex splncs04.bst # polychronies.bib Perrinet23icann.bbl 

touch:
	touch *.tex

blog:
	cp $(SRC).pdf ~/metagit/blog/hugo_academic/content/publication/$(SLUG)/$(SLUG).pdf

git:
	git pull
	git commit -am'Another pass'
	git push

# macros
%.pdf: %.tex
	$(LATEXMK) $<

%.pdf: %.svg
	$(INKSCAPE) --without-gui $< --export-pdf=$@

%.png: %.svg
	$(INKSCAPE) --without-gui $< --export-png=$@ -d 450

# cleaning macro
clean:
	rm -f *.dvi *.fls *.ilg *.ind *idx *.bcf *.run.xml *.dvi *.ps *.out *.log *.aux *.bbl *.blg  *.fdb_latexmk *.snm *.nav *.toc *.info *.synctex.gz* $(SRC).pdf  *-nup.pdf