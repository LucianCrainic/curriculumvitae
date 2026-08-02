TECTONIC ?= tectonic

SOURCE_DIR := src
OUTPUT_DIR := output/pdf
LIGHT_PDF := $(OUTPUT_DIR)/Lucian-Crainic-CV-light.pdf
DARK_PDF := $(OUTPUT_DIR)/Lucian-Crainic-CV-dark.pdf
SOURCES := \
	$(wildcard $(SOURCE_DIR)/*.tex) \
	$(wildcard $(SOURCE_DIR)/*.sty) \
	$(wildcard $(SOURCE_DIR)/sections/*.tex) \
	$(wildcard $(SOURCE_DIR)/fonts/*) \
	$(SOURCE_DIR)/cv.cls

.DEFAULT_GOAL := all
.DELETE_ON_ERROR:

.PHONY: all light dark clean

all: light dark

light: $(LIGHT_PDF)

dark: $(DARK_PDF)

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

$(LIGHT_PDF): $(SOURCES) | $(OUTPUT_DIR)
	cd $(SOURCE_DIR) && $(TECTONIC) --outdir ../$(OUTPUT_DIR) main.tex
	mv $(OUTPUT_DIR)/main.pdf $@

$(DARK_PDF): $(SOURCES) | $(OUTPUT_DIR)
	cd $(SOURCE_DIR) && $(TECTONIC) --outdir ../$(OUTPUT_DIR) main-dark.tex
	mv $(OUTPUT_DIR)/main-dark.pdf $@

clean:
	rm -f $(OUTPUT_DIR)/main.* $(OUTPUT_DIR)/main-* $(LIGHT_PDF) $(DARK_PDF)
