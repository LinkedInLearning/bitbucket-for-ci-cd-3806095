README_FILES := $(shell find . -name 'README.md' -not -path './.git/*')

hello:
	@echo "This makefile has the following tasks:"
	@echo "\tspellcheck  - spell check README files"
	@echo "\tfooter      - generate footer links for README files"
	@echo "\tpdf         - generate PDFs for README files"
	@echo "\tclean       - remove backup files"
	@echo "\tall         - run all tasks (except clean)"

all: spellcheck toc footer pdf
	@echo "Done."

spellcheck:
	@echo "Spell checking README files..."
	@for file in $(README_FILES); do \
		echo "\t$$file"; \
		aspell check --mode=markdown --lang=en $$file; \
	done

toc:
	@echo "Generating table of contents for README files..."
	@docker pull ghcr.io/managedkaos/readme-toc-generator:main
	@docker run --rm ghcr.io/managedkaos/readme-toc-generator:main

footer:
	@echo "Generating footer links for README files..."
	@docker pull ghcr.io/managedkaos/readme-footer-generator:main
	@docker run --rm ghcr.io/managedkaos/readme-footer-generator:main

pdf:
	@echo "Generating PDFs..."
	@while read -r dir; do \
		$(MAKE) --no-print-directory --directory $(PROJECT_HOME)/$$dir; \
	done < CHAPTER_LIST.txt
	@cd $(PROJECT_HOME);

countlines:
	@find . -type f -name README.md -exec wc -l {} \; | sort -nr

chapterlist:
	@find . -type f -name README.md | sed 's/\/README.md//' | sed 's/\.\///' | sed '/\./d' | sort | tee CHAPTER_LIST.txt

overlay:
	@find . -type f -name README.md | sort | sed 's/^\.\///' | sed 's/\// > /g' | sed 's/ > README.md//'

clean:
	find . -type f -name \*.bak -exec rm -vf {} \;
	find . -type f -name \*.new -exec rm -vf {} \;

nuke: clean
	find /tmp/ -type f -name \*.pdf -exec rm -vf {} \;
