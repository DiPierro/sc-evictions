# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
DATA = README.md sc_cities.rds sc_cities_boundaries.rds sc_joined.rds

# EDA studies
EDA = README.md sc_cities.Rmd

# Reports
REPORTS = README.md

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies

sc_joined.rds : sc_cities.rds sc_cities_boundaries.rds

# EDA study and report dependencies
sc_cities.Rmd : sc_cities.rds

# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
