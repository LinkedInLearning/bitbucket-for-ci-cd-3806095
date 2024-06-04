README_FILES := $(shell find . -type f -name 'README.md' -not -path './.git/*')
DIRECTORIES := $(shell find $(PWD) -type f -name 'README.md' -exec dirname {} \;)

hello:
	@echo "This makefile has the following tasks:"
	@echo "\tspellcheck  - spell check README files"
	@echo "\tfooter      - generate footer links for README files"
	@echo "\tpdf         - generate PDFs for README files"
	@echo "\tclean       - remove backup files"
	@echo "\tall         - run all tasks (except clean)"

#all: lint spellcheck toc footer pdf
all: lint spellcheck footer
	@echo "Done."

lint:
	-@docker run -v $(PWD):/workdir davidanson/markdownlint-cli2:v0.13.0 $(README_FILES) 2>&1 | \
		docker run --interactive ghcr.io/managedkaos/summarize-markdown-lint:main

rawlint:
	-@docker run -v $(PWD):/workdir davidanson/markdownlint-cli2:v0.13.0 $(README_FILES) 2>&1

spellcheck:
	@echo "Spell checking README files..."
	@for file in $(README_FILES); do \
		echo "\t$$file"; \
		aspell check --mode=markdown --lang=en $$file; \
	done

toc:
	@echo "Generating table of contents for README files..."
	@docker pull ghcr.io/managedkaos/readme-toc-generator:main
	@docker run --rm --volume $(PWD):/data ghcr.io/managedkaos/readme-toc-generator:main

footer:
	@echo "Generating footer links for README files..."
	@docker pull ghcr.io/managedkaos/readme-footer-generator:main
	@docker run --rm --volume $(PWD):/data ghcr.io/managedkaos/readme-footer-generator:main

pdf: $(DIRECTORIES)

$(DIRECTORIES):
	@echo "Processing directory: $@"
	@cd $@ && pandoc README.md -o $(notdir $@)-README.pdf
	@cd $(PROJECT_HOME)

countlines:
	@find . -type f -name README.md -exec wc -l {} \; | sort -nr

chapterlist:
	@find . -type f -name README.md | sed 's/\/README.md//' | sed 's/\.\///' | sed '/\./d' | sort #| tee CHAPTER_LIST.txt

overlay:
	@find . -type f -name README.md | sort | sed 's/^\.\///' | sed 's/\// > /g' | sed 's/ > README.md//'

clean:
	find . -type f -name \*.pdf -exec rm -vf {} \;
	find . -type f -name \*.bak -exec rm -vf {} \;
	find . -type f -name \*.new -exec rm -vf {} \;

nuke: clean
	find /tmp/ -type f -name \*.pdf -exec rm -vf {} \;

.PHONY: hello lint spellcheck toc footer pdf countlines chapterlist overlay clean nuke $(DIRECTORIES)
